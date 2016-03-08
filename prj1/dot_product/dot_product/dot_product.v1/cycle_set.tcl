
# Loop constraints
directive set /dot_product/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /dot_product/core/main/MAC:io_read(input_a:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC:io_read(input_b:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/io_write(output:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /dot_product/core/main/MAC:and CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC:mul CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC:and#1 CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC:acc CSTEPS_FROM {{.. == 1}}
