
# Loop constraints
directive set /markers/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /markers/core/main/asn#96 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#97 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#98 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#99 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#100 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#101 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#102 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#103 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#104 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#105 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#106 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#107 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#108 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#109 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#110 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#111 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#112 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/asn#113 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /markers/core/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/if:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/aif#5:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:aif#1:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:aif#2:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:and CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:and#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/else:and#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/mux#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/mux#6 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/main/mux#7 CSTEPS_FROM {{.. == 1}}
