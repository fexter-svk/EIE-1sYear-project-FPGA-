
# Loop constraints
directive set /markers/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /markers/core/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
