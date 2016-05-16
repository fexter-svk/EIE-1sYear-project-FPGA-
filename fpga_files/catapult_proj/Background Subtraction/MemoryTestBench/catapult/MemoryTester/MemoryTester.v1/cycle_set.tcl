
# Loop constraints
directive set /MemoryTester/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /MemoryTester/core/core:rlp/main CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /MemoryTester/core/core:rlp/main/if:for CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /MemoryTester/core/core:rlp/main/if:io_write(enabled:rsc.d) CSTEPS_FROM {{.. == 0}}
directive set /MemoryTester/core/core:rlp/main/if:for/if:for:if:io_write(bit_out:rsc.d)#1 CSTEPS_FROM {{.. == 1}}
directive set /MemoryTester/core/core:rlp/main/else#1:io_write(enabled:rsc.d) CSTEPS_FROM {{.. == 0}}

# Real operation constraints
directive set /MemoryTester/core/core:rlp/main/if:for/if:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /MemoryTester/core/core:rlp/main/if:for/if:for:acc CSTEPS_FROM {{.. == 1}}
