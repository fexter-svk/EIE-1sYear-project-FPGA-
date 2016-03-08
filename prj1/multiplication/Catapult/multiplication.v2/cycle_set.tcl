
# Loop constraints
directive set /multiplication/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /multiplication/core/main/MAC:io_read(input_a:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:io_read(input_b:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:io_write(output:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /multiplication/core/main/MAC:and#8 CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:mux CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:mux#7 CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:mul CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /multiplication/core/main/MAC:acc CSTEPS_FROM {{.. == 1}}
