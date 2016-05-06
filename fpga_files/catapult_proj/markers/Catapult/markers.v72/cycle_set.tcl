
# Loop constraints
directive set /markers/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /markers/core/core:rlp/main CSTEPS_FROM {{. == 4} {.. == 0}}

# IO operation constraints
directive set /markers/core/core:rlp/main/asn#181 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#182 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#183 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#184 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#185 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#186 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#187 CSTEPS_FROM {{.. == 1}}
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
directive set /markers/core/core:rlp/main/asn#191 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#192 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#193 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#194 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#195 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#196 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#197 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#198 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#199 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#200 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 3}}

# Real operation constraints
directive set /markers/core/core:rlp/main/if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/acc#11 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#11:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#13:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#3:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#17:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#3:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#3 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/acc#3 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#4 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#5 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/deltax_square_blue:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/aif#39:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#41:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#45:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/deltay_square_blue:acc#1 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/aif#47:aif:acc CSTEPS_FROM {{.. == 3}}
