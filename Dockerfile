FROM continuumio/miniconda3

ARG USERNAME=user
ARG UID=1000
ARG GID=1000
ENV PYTHON_VERSION=3.12

# Create user matching host UID/GID
RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/zsh ${USERNAME}

# Install system packages
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    libtool \
    bison \
    flex \
    make \
    g++ \
    zsh \
    curl \
    git \
    fuse \
    gawk \
    clang \
    docker.io \
    libc6-dev \
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Fix missing symlinks in headers
RUN ln -s /usr/include/x86_64-linux-gnu/bits /usr/include/bits 2>/dev/null || true && \
    ln -s /usr/include/x86_64-linux-gnu/sys  /usr/include/sys  2>/dev/null || true && \
    ln -s /usr/include/x86_64-linux-gnu/gnu  /usr/include/gnu  2>/dev/null || true && \
    ln -s /usr/include/x86_64-linux-gnu/asm  /usr/include/asm  2>/dev/null || true

# Install oh-my-zsh for root (shared skeleton)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Copy project files
WORKDIR /app
COPY . /app

# Install Python and environment
RUN conda install -y python=${PYTHON_VERSION} && conda clean -afy
RUN conda env update -n base -f /app/environment.yml && conda clean -afy

# Initialize conda in bash/zsh
RUN conda init bash && conda init zsh

# Switch to non-root user
USER ${USERNAME}
WORKDIR /app

# Install rust under non-root user
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y --default-toolchain 1.84.1

# Add Rust and Conda to path for non-root user
ENV PATH="/home/${USERNAME}/.cargo/bin:/opt/conda/bin:$PATH"

# Set up .zshrc for user: no welcome prompt, auto-activate conda
RUN touch ~/.zshrc && \
    echo "source /opt/conda/etc/profile.d/conda.sh" >> ~/.zshrc && \
    echo "conda activate base" >> ~/.zshrc && \
    echo "alias ll='ls -alF'" >> ~/.zshrc

# Launch shell
CMD ["/bin/zsh", "-i"]