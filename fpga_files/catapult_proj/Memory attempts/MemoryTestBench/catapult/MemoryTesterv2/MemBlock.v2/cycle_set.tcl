
# Loop constraints
directive set /MemBlock/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /MemBlock/core/core:rlp/data:vinit CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /MemBlock/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 1}}

# IO operation constraints
directive set /MemBlock/core/core:rlp/main/row:io_read(row:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/col:io_read(col:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/bit_in:io_read(bit_in:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/io_read(write_enable:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/if:io_write(bits_out:rsc.d)#1 CSTEPS_FROM {{.. == 2}}

# Real operation constraints
directive set /MemBlock/core/core:rlp/data:vinit/if:write_mem(data:rsc.d)#1 CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/data:vinit/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/if:write_mem(data:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/else:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/else:acc CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/else:read_mem(data:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /MemBlock/core/core:rlp/main/mux CSTEPS_FROM {{.. == 2}}
