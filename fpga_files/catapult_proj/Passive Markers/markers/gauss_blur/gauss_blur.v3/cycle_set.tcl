
# Loop constraints
directive set /gauss_blur/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /gauss_blur/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /gauss_blur/core/core:rlp/main/asn#208 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#209 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#210 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#211 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#212 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#213 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#214 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#1 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#2 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#3 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#4 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#5 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#6 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#7 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#8 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#9 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#10 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#11 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#12 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#13 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#14 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#15 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#16 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#17 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#18 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#19 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#4:asn#20 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#218 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#219 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#220 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#221 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#222 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/asn#223 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/io_write(volume:rsc.d) CSTEPS_FROM {{.. == 2}}
directive set /gauss_blur/core/core:rlp/main/io_write(vout:rsc.d) CSTEPS_FROM {{.. == 2}}
directive set /gauss_blur/core/core:rlp/main/SHIFT:if:else:else:if:asn#1 CSTEPS_FROM {{.. == 3}}

# Real operation constraints
directive set /gauss_blur/core/core:rlp/main/if#3:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#3:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#3:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/acc#14 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#3:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#3:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#3:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/and CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/and#2 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/and#3 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/aif#13:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#6:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/aif#17:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#6:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/mux#3 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/acc#3 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/mux#4 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/mux#5 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/deltax_square_blue:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/aif#39:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/aif#41:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/aif#45:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/deltay_square_blue:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/aif#47:aif:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/acc#9 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/volume_current:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/volume_current:acc CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/volume_current:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/volume_current:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/volume_current:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/volume_current:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/volume_current:acc#7 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/volume_current:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#17:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/if#17:acc CSTEPS_FROM {{.. == 2}}
directive set /gauss_blur/core/core:rlp/main/aif#51:acc CSTEPS_FROM {{.. == 2}}
directive set /gauss_blur/core/core:rlp/main/mux#12 CSTEPS_FROM {{.. == 2}}
directive set /gauss_blur/core/core:rlp/main/or#4 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/or#3 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/or#5 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/or#6 CSTEPS_FROM {{.. == 1}}
directive set /gauss_blur/core/core:rlp/main/or#7 CSTEPS_FROM {{.. == 1}}
