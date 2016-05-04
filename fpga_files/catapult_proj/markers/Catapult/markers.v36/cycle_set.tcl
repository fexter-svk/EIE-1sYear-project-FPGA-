
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
directive set /markers/core/core:rlp/main/vga_xy:asn#6 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#7 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#8 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#9 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#10 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#11 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#12 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#13 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#14 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/vga_xy:asn#15 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#101 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#102 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#103 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#104 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#105 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#106 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#107 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#108 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#109 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#110 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#111 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#112 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#113 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#114 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/asn#115 CSTEPS_FROM {{.. == 1}}
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
directive set /markers/core/core:rlp/main/and#1 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/aif#5:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#2:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:aif#1:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:aif#1:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:aif#2:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/else#2:if:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/mux1h CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/if#4:acc CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#4 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#5 CSTEPS_FROM {{.. == 1}}
directive set /markers/core/core:rlp/main/and#6 CSTEPS_FROM {{.. == 1}}
