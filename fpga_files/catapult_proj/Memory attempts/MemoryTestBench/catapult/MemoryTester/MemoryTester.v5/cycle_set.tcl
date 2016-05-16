
# Loop constraints
directive set /MemoryTester/core/main CSTEPS_FROM {{. == 2}}
directive set /MemoryTester/core/main/if:for CSTEPS_FROM {{. == 1} {.. == 2}}
directive set /MemoryTester/core/main/if:for/if:for:for CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /MemoryTester/core/main/if:io_write(enabled:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /MemoryTester/core/main/if:for/if:for:for/if:for:for:io_write(row:rsc.d) CSTEPS_FROM {{.. == 0}}
directive set /MemoryTester/core/main/if:for/if:for:for/if:for:for:io_write(col:rsc.d) CSTEPS_FROM {{.. == 0}}
directive set /MemoryTester/core/main/if:for/if:for:for/if:for:for:if:io_write(bit_out:rsc.d)#1 CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /MemoryTester/core/main/if:for/if:for:for/if:for:for:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /MemoryTester/core/main/if:for/if:for:for/if:for:for:acc CSTEPS_FROM {{.. == 1}}
directive set /MemoryTester/core/main/if:for/if:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /MemoryTester/core/main/if:for/if:for:acc CSTEPS_FROM {{.. == 1}}
