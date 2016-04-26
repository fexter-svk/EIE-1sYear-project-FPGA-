
# Loop constraints
directive set /mean_vga/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /mean_vga/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /mean_vga/core/core:rlp/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/io_write(counter:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /mean_vga/core/core:rlp/main/acc CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/if#7:acc CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/and CSTEPS_FROM {{.. == 1}}
