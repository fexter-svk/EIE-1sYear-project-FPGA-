
# Loop constraints
directive set /markers/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /markers/core/core:rlp/main CSTEPS_FROM {{. == 5} {.. == 0}}

# IO operation constraints
directive set /markers/core/core:rlp/main/asn#169 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#170 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#171 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#172 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#173 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#174 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#175 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#177 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#178 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#179 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#180 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#181 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/asn#187 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#188 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#189 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#190 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#191 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/asn#192 CSTEPS_FROM {{.. == 4}}
directive set /markers/core/core:rlp/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 4}}
directive set /markers/core/core:rlp/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 4}}

# Real operation constraints
directive set /markers/core/core:rlp/main/if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/acc#7 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:if:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/else#2:mux CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#2 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#3 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/mux#4 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/deltax_blue:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/if#11:acc CSTEPS_FROM {{.. == 2}}
directive set /markers/core/core:rlp/main/aif#31:acc CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/mux#6 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/mux#7 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#12:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#35:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#12:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/deltax_square_blue:acc#1 CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/else#12:acc CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/else#12:if:acc CSTEPS_FROM {{.. == 3}}
directive set /markers/core/core:rlp/main/deltay_square_blue:acc#1 CSTEPS_FROM {{.. == 4}}
directive set /markers/core/core:rlp/main/else#12:aif#1:acc CSTEPS_FROM {{.. == 4}}
directive set /markers/core/core:rlp/main/else#12:if:acc#1 CSTEPS_FROM {{.. == 4}}
