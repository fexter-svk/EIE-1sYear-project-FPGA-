
# Loop constraints
directive set /markers/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /markers/core/core:rlp/main CSTEPS_FROM {{. == 4} {.. == 0}}

# IO operation constraints
directive set /markers/core/core:rlp/main/asn#106 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#107 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#108 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#109 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#110 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#111 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#112 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#114 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#115 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#116 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#117 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#118 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#119 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#120 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#121 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#122 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#123 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#126 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#127 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#128 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#129 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#130 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#131 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#132 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#133 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#134 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#135 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 3}}

# Real operation constraints
directive set /markers/core/core:rlp/main/if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#5:aif:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/if#2:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#3 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#4 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#5 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/deltax:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/if#7:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/deltay:acc#1 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/if#7:acc#1 CSTEPS_FROM {{.. == 3}}
