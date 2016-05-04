
# Loop constraints
directive set /markers/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /markers/core/main/asn#106 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#107 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#108 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#109 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#110 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#111 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#112 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#113 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#114 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#115 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#116 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#117 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#118 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#119 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#120 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#121 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#122 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#123 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /markers/core/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/if:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/aif#5:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:aif#1:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:aif#2:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:and CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:and#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:and#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/mux#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/mux#6 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/mux#7 CSTEPS_FROM {{.. == 1}}
