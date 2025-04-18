import os
import shutil
import string
import pathlib
import doit
import hashlib
import wlutil
import re
import zipfile
import urllib.request
import time
import logging

# Note: All argument paths are expected to be absolute paths

# Some common directories for this module (all absolute paths)
br_dir = pathlib.Path(__file__).parent
fm_dir = br_dir.parents[3]
overlay = br_dir / 'overlay'

# Buildroot puts its output images here
img_dir = br_dir / 'buildroot' / 'output' / 'images'

GH_REPO = 'firemarshal-public-br-images'
GH_ORG = 'firesim'
URL_PREFIX = f"https://raw.githubusercontent.com/{GH_ORG}/{GH_REPO}"


def get_url(file_path):
    return f"{URL_PREFIX}/main/{file_path}"


def make_relative(path):
    path_str = str(path)
    return path_str.replace(str(fm_dir) + "/", "")


initTemplate = string.Template("""#!/bin/sh

SYSLOGD_ARGS=-n
KLOGD_ARGS=-n

start() {
    echo "launching firemarshal workload run/command" && /firemarshal.sh $args && echo "firemarshal workload run/command done"
}

case "$$1" in
  start)
  start
  ;;
  stop)
  #stop
  ;;
  restart|reload)
  start
  ;;
  *)
  echo "Usage: $$0 {start|stop|restart}"
  exit 1
esac

exit""")


def hashOpts(opts):
    """Return a unique description of this builder, based on the provided opts and sha of buildroot"""

    if len(opts) == 0:
        return None

    h = hashlib.md5()
    if 'configs' in opts:
        for c in opts['configs']:
            with open(c, 'rb') as cf:
                h.update(cf.read())

    if 'environment' in opts:
        # use the relative path for the hash (so it is reproducible across machines)
        env_str = make_relative(str(opts['environment']))
        h.update(env_str.encode('utf-8'))

    gs = wlutil.checkGitStatus(br_dir / 'buildroot')
    # if the repo is dirty this hash will always be different from the prior run
    h.update(str(gs).encode('utf-8'))

    return h.hexdigest()[0:4]


def mergeOpts(base, new):
    """Given two ['distro']['opts'] objects, return a merged version"""
    merged = {
            "configs": base['configs'] + new['configs'],
            "environment": {**base['environment'], **new['environment']}
    }

    return merged


def initOpts(cfg):
    """Given a raw marshal config object, perform any distro-specific
    intialization (using the cfg['distro']['opts'] field)."""

    if cfg['distro']['name'] != "br":
        raise ValueError("Wrong config type for BuildRoot: " + cfg['distro']['name'])

    opts = cfg['distro']['opts']
    if 'configs' in opts:
        cleanPaths = []
        for p in opts['configs']:
            p = pathlib.Path(p)
            if p.is_absolute():
                cleanPaths.append(p)
            else:
                cleanPaths.append(cfg['workdir'] / p)

        opts['configs'] = cleanPaths
    else:
        opts['configs'] = []

    if 'environment' not in opts:
        opts['environment'] = {}

    # os.path.expandvars must use os.environ, we we temporarily modify it
    envBackup = os.environ.copy()

    # Expand any variables the user provided for their environment (including
    # the workload path variable we add)
    os.environ[cfg['name'].upper().replace("-", "_") + "_PATH"] = str(cfg['workdir'])
    for k, v in opts['environment'].items():
        opts['environment'][k] = os.path.expandvars(v)
    os.environ = envBackup

    opts['environment'][cfg['name'].upper().replace("-", "_") + "_PATH"] = str(cfg['workdir'])


class Builder:
    """A builder object will be created for each unique set of options (as
    identified by hashOpts) and used to construct the base rootfs for this
    distro."""

    def __init__(self, opts):
        self.opts = opts
        hashed = hashOpts(self.opts)
        if hashed is not None:
            self.name = 'br.' + hashed
        else:
            self.name = 'br'

        self.outputDir = wlutil.getOpt('image-dir') / wlutil.getOpt('board-dir').name / self.name
        self.outputImg = self.outputDir / (self.name + ".img")

    def getWorkload(self):
        return {
                'name': self.name,
                'isDistro': True,
                'distro': {
                    'name': 'br',
                    'opts': {'configs': []}
                },
                'workdir': br_dir,
                'builder': self,
                'img': self.outputImg
                }

    def configure(self, env):
        """Construct the final buildroot configuration for this environment. After
        calling this, it is safe to call 'make' in the buildroot directory."""

        toolVer = wlutil.getToolVersions()
        # Contains options specific to the build environment (br is touchy about this stuff)
        toolKfrag = wlutil.getOpt('gen-dir') / 'brToolKfrag'
        with open(toolKfrag, 'w') as f:
            f.write("BR2_TOOLCHAIN_EXTERNAL_HEADERS_"+toolVer['linuxMaj']+"_"+toolVer['linuxMin']+"=y\n")
            f.write("BR2_TOOLCHAIN_HEADERS_AT_LEAST_"+toolVer['linuxMaj']+"_"+toolVer['linuxMin']+"=y\n")
            f.write('BR2_TOOLCHAIN_HEADERS_AT_LEAST="'+toolVer['linuxMaj']+"."+toolVer['linuxMin']+'"\n')
            f.write('BR2_TOOLCHAIN_GCC_AT_LEAST_'+toolVer['gcc']+'=y\n')
            f.write('BR2_TOOLCHAIN_GCC_AT_LEAST="'+toolVer['gcc']+'"\n')
            f.write('BR2_TOOLCHAIN_EXTERNAL_GCC_'+toolVer['gcc']+'=y\n')
            f.write('BR2_JLEVEL='+str(wlutil.getOpt('jlevel'))+'\n')
            f.write('BR2_PACKAGE_HOST_E2FSPROGS'+'=y\n')

        # Default Configuration (allows us to bump BR independently of our configs)
        defconfig = wlutil.getOpt('gen-dir') / 'brDefConfig'
        wlutil.run(['make', 'defconfig'], cwd=(br_dir / 'buildroot'), env=env)
        shutil.copy(br_dir / 'buildroot' / '.config', defconfig)

        kFrags = [defconfig, toolKfrag] + self.opts['configs']
        mergeScript = br_dir / 'merge_config.sh'
        wlutil.run([mergeScript] + kFrags, cwd=(br_dir / 'buildroot'), env=env)

        # Fakeroot needs to be set to 1.31 to compile with sysroot 2.17
        fakerootVersion = 1.31
        fakerootSite = "https://snapshot.debian.org/archive/debian/20240401T084438Z/pool/main/f/fakeroot"
        fakerootTarFile = f"fakeroot_{fakerootVersion}.orig.tar.gz"
        fakerootTar = br_dir / fakerootTarFile
        fakerootDir = br_dir / f"fakeroot-{fakerootVersion}"

        urllib.request.urlretrieve(fakerootSite + "/" + fakerootTarFile, fakerootTar)
        wlutil.run(["tar", "-xzvf", str(fakerootTar)], cwd=br_dir, env=env)

        # create a local.mk for buildroot
        # Do this to override builtin buildroot package sourcecodes as needed
        localMk = br_dir / 'buildroot' / 'local.mk'
        with open(localMk, 'w') as f:
            f.write(f"FAKEROOT_OVERRIDE_SRCDIR = {str(fakerootDir)}")

    # Build a base image in the requested format and return an absolute path to that image
    def buildBaseImage(self, task, changed):
        """Ensures that the image file specified by baseConfig() exists and is up to date.

        This is called as a doit task.
        See more information about the arguments here (or in the source code): https://pydoit.org/tasks.html#keywords-with-task-metadata

        Args:
            task: a Task object instance (all metadata about the "task" being run) - see doit's task.py source for the variable list
            changed: list of file depencies that have changed since the last successful execution
        """
        log = logging.getLogger()

        # optimization to get cached br distro image
        img_rel_path = make_relative(str(self.outputImg))
        cached_url = get_url(img_rel_path + ".zip")
        cached_local = f"{br_dir}/{self.outputImg.name}.zip"

        # try N times then move on
        for i in range(3):
            try:
                log.info(f"Attempting to download cached image: {cached_url}")
                urllib.request.urlretrieve(cached_url, cached_local)
                break
            except Exception as e:
                log.debug(f"urlretrieve exception: {e}")
            time.sleep(3)

        if os.path.exists(cached_local):
            assert len(task.targets) == 1, "Multiple targets detected for buildroot"
            target_doesnt_exist = not os.path.exists(task.targets[0])
            file_deps_not_changed = not changed
            log.debug(f"Target doesn't exist: {target_doesnt_exist}, File dep(s) not changed: {file_deps_not_changed} {changed}")
            if target_doesnt_exist and file_deps_not_changed:
                log.info(f"Unzipping cached image: {cached_local}")
                with zipfile.ZipFile(cached_local, 'r') as zip_ref:
                    self.outputImg.parent.mkdir(parents=True, exist_ok=True)
                    zip_ref.extractall(self.outputImg.parent)
                os.remove(cached_local)
                log.info(f"Skipping full buildroot build. Using cached image {self.outputImg} from {cached_local}")
                return
            os.remove(cached_local)

        try:
            wlutil.checkSubmodule(br_dir / 'buildroot')

            # Buildroot complains about some common PERL configurations
            env = os.environ.copy()
            env.pop('PERL_MM_OPT', None)
            env = {**env, **self.opts['environment']}

            self.configure(env)

            # Less invasive "make clean":
            # The following comments are not true, you do need to specifically
            # remove things from run dir, but don't need to rebuild everything
            # the find -delete is from https://stackoverflow.com/questions/47320800
            # # This is unfortunate but buildroot can't remove things from the
            # # image without rebuilding everything from scratch. It adds 20min
            # # to the unit tests and anyone who builds a custom buildroot.
            wlutil.run(['rm', '-rf', 'overlay/*'], cwd=br_dir, env=env)
            wlutil.run(['rm', '-rf', "buildroot/output/target/*"], cwd=br_dir, env=env)
            wlutil.run(['find', 'buildroot/output/', '-name', '".stamp_target_installed"', '-delete'], cwd=br_dir, env=env)

            wlutil.run(['make'], cwd=br_dir / "buildroot", env=env)

            self.outputImg.parent.mkdir(parents=True, exist_ok=True)
            shutil.move(img_dir / 'rootfs.ext2', self.outputImg)

            self.outputDir.mkdir(parents=True, exist_ok=True)
            shutil.copy(br_dir / 'buildroot' / '.config', self.outputDir / 'buildroot_config')

        except wlutil.SubmoduleError as e:
            return doit.exceptions.TaskFailed(e)

    def fileDeps(self):
        # List all files that should be checked to determine if BR is uptodate
        deps = []
        deps.append(pathlib.Path(__file__))
        deps += self.opts['configs']

        return deps

    # Return True if the base image is up to date, or False if it needs to be
    # rebuilt. This is in addition to the files in fileDeps()
    def upToDate(self):
        return [wlutil.config_changed(wlutil.checkGitStatus(br_dir / 'buildroot')),
                wlutil.config_changed(hashOpts(self.opts))]

    # Set up the image such that, when run in qemu, it will run the script "script"
    # If None is passed for script, any existing bootscript will be deleted
    @staticmethod
    def generateBootScriptOverlay(script, args):
        # How this works:
        # The buildroot repo has a pre-built overlay with a custom S99run
        # script that init will run last. This script will run the /firemarshal.sh
        # script at boot. We just overwrite this script.
        scriptDst = overlay / 'firemarshal.sh'
        if script is not None:
            shutil.copy(script, scriptDst)
        else:
            scriptDst.unlink()
            # Create a blank init script because overlays won't let us delete stuff
            # Alternatively: we could consider replacing the default.target
            # symlink to disable the firemarshal target entirely
            scriptDst.touch()

        scriptDst.chmod(0o755)

        with open(overlay / 'etc/init.d/S99run', 'w') as f:
            if args is None:
                f.write(initTemplate.substitute(args=''))
            else:
                f.write(initTemplate.substitute(args=' '.join(args)))

        return overlay

    def stripUart(self, lines):
        stripped = []
        inBody = False
        for line in lines:
            if not inBody:
                if re.match("launching firemarshal workload run/command", line):
                    inBody = True
            else:
                if re.match("firemarshal workload run/command done", line):
                    break
                stripped.append(line)

        return stripped
