
# Loop constraints
directive set /markers/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /markers/core/main/asn#182 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#183 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#184 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /markers/core/main/aif#39:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/aif#41:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/aif#47:aif:acc CSTEPS_FROM {{.. == 1}}
