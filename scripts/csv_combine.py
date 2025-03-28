import pandas as pd

df_minor_base = pd.read_csv("./minor_cpu/minor_logs/minor.csv")
df_minor_mtest = pd.read_csv("./minor_cpu/minor_logs/cpu_all_version.csv")
df_sodor = pd.read_csv("./sodor_cpu/sodor_logs/sodor.csv")
df_gem5  = pd.read_csv("./gem5_cpu/gem5_logs/gem5.csv")

df_cpu = pd.merge(df_minor_base, df_minor_mtest, on="benchmarks")
df_cpu = pd.merge(df_cpu, df_sodor, on="benchmarks")
df_cpu = pd.merge(df_cpu, df_gem5, on="benchmarks")

df_cpu.to_csv("../plot/cpu-bmarks.csv", index=False)


