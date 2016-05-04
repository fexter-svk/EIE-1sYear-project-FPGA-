
# Loop constraints
directive set /markers/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /markers/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /markers/core/core:rlp/main/vga_xy:asn CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#109 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#110 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#111 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#112 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#113 CSTEPS_FROM {{.. == 1}}
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
directive set /markers/core/core:rlp/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /markers/core/core:rlp/main/if:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#1:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#5:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#1:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#1:aif#1:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#1:aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#1:aif#2:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#1:if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#1:if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/mux#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#4 CSTEPS_FROM {{.. == 1}}
