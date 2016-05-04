
# Loop constraints
directive set /markers/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /markers/core/core:rlp/main CSTEPS_FROM {{. == 4} {.. == 0}}

# IO operation constraints
directive set /markers/core/core:rlp/main/asn#110 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#111 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#112 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#113 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#114 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#115 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#116 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#6 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#7 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#8 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#9 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#10 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#11 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#12 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#13 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#14 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#15 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#16 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#17 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#18 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#19 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:asn#20 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#120 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#121 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#122 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#123 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#124 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#125 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#126 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#127 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#128 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#129 CSTEPS_FROM {{.. == 3}}
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
directive set /markers/core/core:rlp/main/aif#3:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#7:aif:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/if#2:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#3 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#4 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#5 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/deltax:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/if#7:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/deltay:acc#1 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/if#7:acc#1 CSTEPS_FROM {{.. == 3}}
