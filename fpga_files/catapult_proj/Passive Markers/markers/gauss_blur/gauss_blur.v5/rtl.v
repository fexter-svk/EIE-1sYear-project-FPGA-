// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   gsp14@EEWS305-036
//  Generated date: Sat May 07 14:12:58 2016
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    gauss_blur_core
// ------------------------------------------------------------------


module gauss_blur_core (
  vin, vga_xy, clk, en, arst_n, vout_rsc_mgc_out_stdreg_d, volume_rsc_mgc_out_stdreg_d
);
  input [89:0] vin;
  input [19:0] vga_xy;
  input clk;
  input en;
  input arst_n;
  output [29:0] vout_rsc_mgc_out_stdreg_d;
  reg [29:0] vout_rsc_mgc_out_stdreg_d;
  output [3:0] volume_rsc_mgc_out_stdreg_d;
  reg [3:0] volume_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations
  wire or_dcpl_6;
  reg [89:0] regs_regs_1_sva;
  reg [3:0] acc_16_1_sva;
  reg [9:0] blue_xy_0_sva;
  reg [9:0] blue_xy_1_sva;
  reg [3:0] volume_previous_sva;
  reg [3:0] acc_16_1_sva_dfm_2;
  reg [9:0] blue_xy_0_sva_dfm_3;
  reg [9:0] blue_xy_1_sva_dfm_3;
  reg aif_11_slc_svs_1;
  reg land_11_lpi_1_dfm_1;
  reg land_11_lpi_1_dfm_2;
  reg [26:0] mul_7_itm_1;
  wire [53:0] nl_mul_7_itm_1;
  reg [23:0] mul_6_itm_1;
  wire [47:0] nl_mul_6_itm_1;
  reg [20:0] mul_5_itm_1;
  wire [41:0] nl_mul_5_itm_1;
  reg [17:0] mul_4_itm_1;
  wire [35:0] nl_mul_4_itm_1;
  reg [14:0] mul_3_itm_1;
  wire [29:0] nl_mul_3_itm_1;
  reg [11:0] mul_2_itm_1;
  wire [23:0] nl_mul_2_itm_1;
  reg [8:0] mul_1_itm_1;
  wire [17:0] nl_mul_1_itm_1;
  reg [5:0] slc_gauss_blur_val_20_itm_1;
  reg [4:0] slc_13_itm_1;
  reg slc_11_itm_1;
  reg or_itm_1;
  reg [8:0] or_3_itm_1;
  reg main_stage_0_2;
  reg main_stage_0_3;
  reg [19:0] acc_2_psp_sva_2;
  reg [4:0] mul_itm_1_sg8;
  reg [4:0] mul_itm_1_sg6;
  reg [4:0] mul_itm_1_sg4;
  reg [4:0] mul_itm_1_sg2;
  reg [4:0] mul_itm_2;
  wire [3:0] acc_16_1_sva_dfm_1_mx0;
  wire [9:0] blue_xy_1_sva_dfm_2_mx0;
  wire [28:0] acc_2_psp_sva;
  wire [29:0] nl_acc_2_psp_sva;
  reg reg_deltay_square_blue_acc_psp_sva_tmp;
  wire or_15_cse;
  wire and_6_cse;
  wire [11:0] deltay_square_blue_acc_1_itm;
  wire [12:0] nl_deltay_square_blue_acc_1_itm;
  wire [10:0] aif_45_acc_itm;
  wire [11:0] nl_aif_45_acc_itm;
  wire [11:0] deltax_square_blue_acc_1_itm;
  wire [12:0] nl_deltax_square_blue_acc_1_itm;
  wire [5:0] if_17_acc_1_itm;
  wire [6:0] nl_if_17_acc_1_itm;
  wire [9:0] blue_xy_0_sva_dfm_2_mx0;
  wire [3:0] volume_current_sva;
  wire [4:0] nl_volume_current_sva;
  wire [6:0] conc_imod_sg1_sva;
  wire [8:0] nl_conc_imod_sg1_sva;
  wire [5:0] conc_imod_1_sg1_sva;
  wire [6:0] nl_conc_imod_1_sg1_sva;
  wire [10:0] acc_12_psp_sva;
  wire [11:0] nl_acc_12_psp_sva;
  wire [9:0] blue_xy_1_sva_mx0;
  wire [9:0] blue_xy_0_sva_mx0;
  wire [3:0] acc_16_1_sva_mx0;
  wire [89:0] regs_regs_0_sva_mx0;
  wire [3:0] if_3_acc_svs;
  wire [4:0] nl_if_3_acc_svs;
  wire [28:0] mul_itm;
  wire [57:0] nl_mul_itm;
  wire [6:0] acc_imod_sva;
  wire [8:0] nl_acc_imod_sva;
  wire [31:0] gauss_blur_val_2_sva;
  wire [34:0] nl_gauss_blur_val_2_sva;
  wire [3:0] if_3_acc_1_psp_sva;
  wire [4:0] nl_if_3_acc_1_psp_sva;
  wire [5:0] acc_imod_2_sva;
  wire [6:0] nl_acc_imod_2_sva;
  wire nand_1_itm;
  wire or_13_cse;


  // Interconnect Declarations for Component Instantiations 
  assign or_13_cse = (deltax_square_blue_acc_1_itm[11]) | (aif_45_acc_itm[10]);
  assign and_6_cse = (~ or_15_cse) & main_stage_0_3;
  assign or_15_cse = (readslicef_5_1_4((conv_s2u_4_5(if_17_acc_1_itm[5:2]) + 5'b1)))
      | (readslicef_6_1_5((conv_s2s_5_6(~ (if_17_acc_1_itm[5:1])) + 6'b11)));
  assign acc_16_1_sva_dfm_1_mx0 = MUX_v_4_2_2({(acc_16_1_sva_dfm_2 + 4'b1) , acc_16_1_sva_dfm_2},
      (readslicef_11_1_10((({1'b1 , (~ (acc_2_psp_sva_2[19:10]))}) + 11'b101000001)))
      | aif_11_slc_svs_1 | (readslicef_8_1_7((conv_u2u_7_8(acc_2_psp_sva_2[9:3])
      + 8'b11010011))) | (readslicef_10_1_9(((~ (acc_2_psp_sva_2[9:0])) + 10'b1011010001))));
  assign blue_xy_1_sva_dfm_2_mx0 = MUX_v_10_2_2({(vga_xy[19:10]) , blue_xy_1_sva_dfm_3},
      or_dcpl_6);
  assign blue_xy_0_sva_dfm_2_mx0 = MUX_v_10_2_2({(vga_xy[9:0]) , blue_xy_0_sva_dfm_3},
      or_dcpl_6);
  assign nl_deltay_square_blue_acc_1_itm = ({1'b1 , (vga_xy[19:10]) , 1'b1}) + conv_u2s_11_12({(~
      blue_xy_1_sva_dfm_2_mx0) , 1'b1});
  assign deltay_square_blue_acc_1_itm = nl_deltay_square_blue_acc_1_itm[11:0];
  assign nl_aif_45_acc_itm = ({1'b1 , (~ (deltax_square_blue_acc_1_itm[10:1]))})
      + 11'b101001;
  assign aif_45_acc_itm = nl_aif_45_acc_itm[10:0];
  assign nl_deltax_square_blue_acc_1_itm = ({1'b1 , (vga_xy[9:0]) , 1'b1}) + conv_u2s_11_12({(~
      blue_xy_0_sva_dfm_2_mx0) , 1'b1});
  assign deltax_square_blue_acc_1_itm = nl_deltax_square_blue_acc_1_itm[11:0];
  assign nl_volume_current_sva = conv_s2u_3_4(readslicef_4_3_1((conv_u2s_3_4({(readslicef_3_2_1((conv_u2u_2_3({(conc_imod_sg1_sva[5])
      , 1'b1}) + conv_u2u_2_3({(~ (conc_imod_sg1_sva[6])) , (~((conc_imod_1_sg1_sva[5])
      & (~ (acc_12_psp_sva[10]))))})))) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_12_psp_sva[7])
      , ((acc_12_psp_sva[10]) & (~ (conc_imod_1_sg1_sva[5])) & ((conc_imod_1_sg1_sva[4])
      | (conc_imod_1_sg1_sva[3]) | (conc_imod_1_sg1_sva[2]) | (conc_imod_1_sg1_sva[1])
      | (conc_imod_1_sg1_sva[0]) | (acc_12_psp_sva[1]) | (acc_12_psp_sva[0])))}))))
      + conv_s2u_3_4(acc_12_psp_sva[10:8]);
  assign volume_current_sva = nl_volume_current_sva[3:0];
  assign nl_if_17_acc_1_itm = ({1'b1 , volume_current_sva , 1'b1}) + conv_u2s_5_6({(~
      volume_previous_sva) , 1'b1});
  assign if_17_acc_1_itm = nl_if_17_acc_1_itm[5:0];
  assign nl_conc_imod_sg1_sva = (conv_u2s_6_7({(conv_u2u_2_3(acc_12_psp_sva[9:8])
      + conv_u2u_2_3({(acc_12_psp_sva[10]) , (acc_12_psp_sva[10])})) , (acc_12_psp_sva[10:8])})
      + conv_s2s_6_7({(acc_12_psp_sva[7]) , 1'b0 , (acc_12_psp_sva[7]) , 2'b0 , (acc_12_psp_sva[7])}))
      + ({(acc_12_psp_sva[10]) , 1'b0 , (acc_12_psp_sva[6:2])});
  assign conc_imod_sg1_sva = nl_conc_imod_sg1_sva[6:0];
  assign nl_conc_imod_1_sg1_sva = (readslicef_7_6_1((conv_s2s_6_7({1'b1 , (~ (conc_imod_sg1_sva[6]))
      , 2'b11 , (~ (conc_imod_sg1_sva[6])) , 1'b1}) + conv_u2s_6_7({(conc_imod_sg1_sva[4:0])
      , 1'b1})))) + ({(conc_imod_sg1_sva[5]) , 1'b0 , (conc_imod_sg1_sva[5]) , 2'b0
      , (conc_imod_sg1_sva[5])});
  assign conc_imod_1_sg1_sva = nl_conc_imod_1_sg1_sva[5:0];
  assign nl_acc_12_psp_sva = conv_u2s_10_11(~ blue_xy_1_sva_dfm_2_mx0) + 11'b11111000001;
  assign acc_12_psp_sva = nl_acc_12_psp_sva[10:0];
  assign blue_xy_1_sva_mx0 = MUX_v_10_2_2({blue_xy_1_sva , blue_xy_1_sva_dfm_2_mx0},
      main_stage_0_3);
  assign blue_xy_0_sva_mx0 = MUX_v_10_2_2({blue_xy_0_sva , blue_xy_0_sva_dfm_2_mx0},
      main_stage_0_3);
  assign acc_16_1_sva_mx0 = MUX_v_4_2_2({acc_16_1_sva , acc_16_1_sva_dfm_1_mx0},
      main_stage_0_3);
  assign nl_acc_2_psp_sva = conv_s2u_28_29(conv_u2s_27_28(mul_7_itm_1) + conv_s2s_25_28(conv_u2s_24_25(mul_6_itm_1)
      + conv_s2s_22_25(conv_u2s_21_22(mul_5_itm_1) + conv_s2s_19_22(conv_u2s_18_19(mul_4_itm_1)
      + conv_s2s_16_19(conv_u2s_15_16(mul_3_itm_1) + conv_s2s_13_16(conv_u2s_12_13(mul_2_itm_1)
      + conv_s2s_10_13(conv_u2s_9_10(mul_1_itm_1) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_7_9({slc_gauss_blur_val_20_itm_1
      , 1'b1}) + conv_s2s_6_9({slc_13_itm_1 , (~ slc_11_itm_1)}))))))))))) + ({mul_itm_1_sg8
      , 1'b0 , mul_itm_1_sg6 , 1'b0 , mul_itm_1_sg4 , 1'b0 , mul_itm_1_sg2 , 1'b0
      , mul_itm_2});
  assign acc_2_psp_sva = nl_acc_2_psp_sva[28:0];
  assign regs_regs_0_sva_mx0 = vin & ({{89{main_stage_0_2}}, main_stage_0_2});
  assign nl_if_3_acc_svs = conv_s2u_1_4(if_3_acc_1_psp_sva[3]) + if_3_acc_1_psp_sva;
  assign if_3_acc_svs = nl_if_3_acc_svs[3:0];
  assign nl_mul_itm = conv_u2u_2_29(gauss_blur_val_2_sva[31:30]) * 29'b111000111000111000111000111;
  assign mul_itm = nl_mul_itm[28:0];
  assign nl_acc_imod_sva = (conv_u2u_6_7(conv_u2u_5_6(conv_u2u_4_5(conv_u2u_3_4(gauss_blur_val_2_sva[20:18])
      + conv_u2u_3_4(~ (gauss_blur_val_2_sva[23:21]))) + conv_u2u_4_5(readslicef_5_4_1((conv_u2u_4_5({(gauss_blur_val_2_sva[26:24])
      , 1'b1}) + conv_u2u_4_5({(~ (gauss_blur_val_2_sva[29:27])) , 1'b1}))))) + conv_u2u_4_6(conv_u2u_3_4(gauss_blur_val_2_sva[2:0])
      + conv_u2u_3_4(~ (gauss_blur_val_2_sva[5:3])))) + conv_u2u_5_7(conv_u2u_4_5(conv_u2u_3_4(gauss_blur_val_2_sva[8:6])
      + conv_u2u_3_4(~ (gauss_blur_val_2_sva[11:9]))) + conv_u2u_4_5(conv_u2u_3_4(gauss_blur_val_2_sva[14:12])
      + conv_u2u_3_4(~ (gauss_blur_val_2_sva[17:15]))))) + ({5'b10111 , (gauss_blur_val_2_sva[31:30])});
  assign acc_imod_sva = nl_acc_imod_sva[6:0];
  assign nl_gauss_blur_val_2_sva = ((conv_u2u_31_32(conv_u2u_30_31(regs_regs_1_sva[59:30])
      + conv_u2u_30_31(regs_regs_1_sva[29:0])) + conv_u2u_30_32(vin[89:60])) + conv_u2u_31_32(conv_u2u_30_31(vin[59:30])
      + conv_u2u_30_31(vin[29:0]))) + (conv_u2u_31_32(conv_u2u_30_31(regs_regs_0_sva_mx0[89:60])
      + conv_u2u_30_31(regs_regs_0_sva_mx0[59:30])) + conv_u2u_31_32(conv_u2u_30_31(regs_regs_0_sva_mx0[29:0])
      + conv_u2u_30_31(regs_regs_1_sva[89:60])));
  assign gauss_blur_val_2_sva = nl_gauss_blur_val_2_sva[31:0];
  assign nl_if_3_acc_1_psp_sva = (readslicef_5_4_1((({(~ (acc_imod_2_sva[3])) , 4'b1})
      + conv_s2u_3_5(acc_imod_2_sva[5:3])))) + ({1'b1 , (acc_imod_2_sva[2:0])});
  assign if_3_acc_1_psp_sva = nl_if_3_acc_1_psp_sva[3:0];
  assign nl_acc_imod_2_sva = conv_s2s_5_6(({3'b100 , (vga_xy[9:8])}) + conv_u2s_4_5(readslicef_5_4_1((conv_u2u_4_5({(vga_xy[2:0])
      , 1'b1}) + conv_u2u_4_5(vga_xy[6:3]))))) + conv_u2s_5_6({(conv_u2u_1_2(~ (vga_xy[3]))
      + conv_u2u_1_2(~ (vga_xy[7]))) , 2'b0 , (readslicef_2_1_1((conv_u2u_1_2(vga_xy[7])
      + 2'b1)))});
  assign acc_imod_2_sva = nl_acc_imod_2_sva[5:0];
  assign nand_1_itm = ~((~((vga_xy[9]) | (vga_xy[8]) | (vga_xy[7]) | (vga_xy[6])
      | (vga_xy[5]) | (vga_xy[4]) | (vga_xy[3]) | (vga_xy[2]) | (vga_xy[1]) | (vga_xy[0])))
      & (~((vga_xy[19]) | (vga_xy[18]) | (vga_xy[17]) | (vga_xy[16]) | (vga_xy[15])
      | (vga_xy[14]) | (vga_xy[13]) | (vga_xy[12]) | (vga_xy[11]) | (vga_xy[10]))));
  assign or_dcpl_6 = ~((~((blue_xy_1_sva_dfm_3[9]) | (blue_xy_1_sva_dfm_3[8]) | (blue_xy_1_sva_dfm_3[7])
      | (blue_xy_1_sva_dfm_3[6]) | (blue_xy_1_sva_dfm_3[5]) | (blue_xy_1_sva_dfm_3[4])
      | (blue_xy_1_sva_dfm_3[3]) | (blue_xy_1_sva_dfm_3[2]) | (blue_xy_1_sva_dfm_3[1])
      | (blue_xy_1_sva_dfm_3[0]) | (blue_xy_0_sva_dfm_3[9]) | (blue_xy_0_sva_dfm_3[8])
      | (blue_xy_0_sva_dfm_3[7]) | (blue_xy_0_sva_dfm_3[6]) | (blue_xy_0_sva_dfm_3[5])
      | (blue_xy_0_sva_dfm_3[4]) | (blue_xy_0_sva_dfm_3[3]) | (blue_xy_0_sva_dfm_3[2])
      | (blue_xy_0_sva_dfm_3[1]) | (blue_xy_0_sva_dfm_3[0]))) & (readslicef_5_1_4((({1'b1
      , (~ acc_16_1_sva_dfm_1_mx0)}) + 5'b101))));
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      vout_rsc_mgc_out_stdreg_d <= 30'b0;
      volume_rsc_mgc_out_stdreg_d <= 4'b0;
      acc_16_1_sva_dfm_2 <= 4'b0;
      acc_2_psp_sva_2 <= 20'b0;
      blue_xy_1_sva_dfm_3 <= 10'b0;
      blue_xy_0_sva_dfm_3 <= 10'b0;
      volume_previous_sva <= 4'b0;
      land_11_lpi_1_dfm_2 <= 1'b0;
      or_3_itm_1 <= 9'b0;
      aif_11_slc_svs_1 <= 1'b0;
      main_stage_0_2 <= 1'b0;
      main_stage_0_3 <= 1'b0;
      blue_xy_1_sva <= 10'b0;
      blue_xy_0_sva <= 10'b0;
      acc_16_1_sva <= 4'b0;
      land_11_lpi_1_dfm_1 <= 1'b0;
      or_itm_1 <= 1'b0;
      mul_7_itm_1 <= 27'b0;
      mul_6_itm_1 <= 24'b0;
      mul_5_itm_1 <= 21'b0;
      mul_4_itm_1 <= 18'b0;
      mul_3_itm_1 <= 15'b0;
      mul_2_itm_1 <= 12'b0;
      mul_1_itm_1 <= 9'b0;
      slc_gauss_blur_val_20_itm_1 <= 6'b0;
      slc_13_itm_1 <= 5'b0;
      slc_11_itm_1 <= 1'b0;
      mul_itm_1_sg8 <= 5'b0;
      mul_itm_1_sg6 <= 5'b0;
      mul_itm_1_sg4 <= 5'b0;
      mul_itm_1_sg2 <= 5'b0;
      mul_itm_2 <= 5'b0;
      regs_regs_1_sva <= 90'b0;
      reg_deltay_square_blue_acc_psp_sva_tmp <= 1'b0;
    end
    else begin
      if ( en ) begin
        vout_rsc_mgc_out_stdreg_d <= MUX_v_30_2_2({vout_rsc_mgc_out_stdreg_d , ({land_11_lpi_1_dfm_2
            , or_3_itm_1 , (acc_2_psp_sva_2[19:10]) , ((acc_2_psp_sva_2[9:0]) | (signext_10_1(~((readslicef_11_1_10((({1'b1
            , (~ (deltay_square_blue_acc_1_itm[10:1]))}) + 11'b101001))) | (MUX_s_1_2_2({(deltay_square_blue_acc_1_itm[11])
            , reg_deltay_square_blue_acc_psp_sva_tmp}, or_13_cse)) | (aif_45_acc_itm[10])
            | (deltax_square_blue_acc_1_itm[11])))))})}, main_stage_0_3);
        volume_rsc_mgc_out_stdreg_d <= MUX1HOT_v_4_3_2({volume_rsc_mgc_out_stdreg_d
            , volume_current_sva , volume_previous_sva}, {(~ main_stage_0_3) , and_6_cse
            , (or_15_cse & main_stage_0_3)});
        acc_16_1_sva_dfm_2 <= acc_16_1_sva_mx0 & ({{3{or_itm_1}}, or_itm_1});
        acc_2_psp_sva_2 <= acc_2_psp_sva[19:0];
        blue_xy_1_sva_dfm_3 <= blue_xy_1_sva_mx0 & ({{9{nand_1_itm}}, nand_1_itm});
        blue_xy_0_sva_dfm_3 <= blue_xy_0_sva_mx0 & ({{9{nand_1_itm}}, nand_1_itm});
        volume_previous_sva <= MUX_v_4_2_2({volume_previous_sva , volume_current_sva},
            and_6_cse);
        land_11_lpi_1_dfm_2 <= land_11_lpi_1_dfm_1;
        or_3_itm_1 <= (acc_2_psp_sva[28:20]) | ({{8{land_11_lpi_1_dfm_1}}, land_11_lpi_1_dfm_1});
        aif_11_slc_svs_1 <= readslicef_10_1_9((({1'b1 , (~ (acc_2_psp_sva[28:20]))})
            + 10'b101000001));
        main_stage_0_2 <= 1'b1;
        main_stage_0_3 <= main_stage_0_2;
        blue_xy_1_sva <= blue_xy_1_sva_mx0;
        blue_xy_0_sva <= blue_xy_0_sva_mx0;
        acc_16_1_sva <= acc_16_1_sva_mx0;
        land_11_lpi_1_dfm_1 <= ~((readslicef_11_1_10((({1'b1 , (~ (vga_xy[19:10]))})
            + 11'b101001))) | (readslicef_11_1_10((({1'b1 , (~ (vga_xy[9:0]))}) +
            11'b101001))));
        or_itm_1 <= (if_3_acc_svs[3]) | (if_3_acc_svs[2]) | (if_3_acc_svs[1]) | (if_3_acc_svs[0]);
        mul_7_itm_1 <= nl_mul_7_itm_1[26:0];
        mul_6_itm_1 <= nl_mul_6_itm_1[23:0];
        mul_5_itm_1 <= nl_mul_5_itm_1[20:0];
        mul_4_itm_1 <= nl_mul_4_itm_1[17:0];
        mul_3_itm_1 <= nl_mul_3_itm_1[14:0];
        mul_2_itm_1 <= nl_mul_2_itm_1[11:0];
        mul_1_itm_1 <= nl_mul_1_itm_1[8:0];
        slc_gauss_blur_val_20_itm_1 <= gauss_blur_val_2_sva[8:3];
        slc_13_itm_1 <= readslicef_6_5_1((({2'b10 , (acc_imod_sva[5:3]) , 1'b1})
            + conv_u2s_5_6({(~ (acc_imod_sva[6])) , (~ (gauss_blur_val_2_sva[8:6]))
            , (acc_imod_sva[6])})));
        slc_11_itm_1 <= readslicef_5_1_4((({1'b1 , (acc_imod_sva[2:0]) , 1'b1}) +
            conv_u2s_4_5({(~ (acc_imod_sva[5:3])) , (~ (acc_imod_sva[6]))})));
        mul_itm_1_sg8 <= mul_itm[28:24];
        mul_itm_1_sg6 <= mul_itm[22:18];
        mul_itm_1_sg4 <= mul_itm[16:12];
        mul_itm_1_sg2 <= mul_itm[10:6];
        mul_itm_2 <= mul_itm[4:0];
        regs_regs_1_sva <= regs_regs_0_sva_mx0;
        reg_deltay_square_blue_acc_psp_sva_tmp <= MUX_s_1_2_2({reg_deltay_square_blue_acc_psp_sva_tmp
            , (MUX_s_1_2_2({(deltay_square_blue_acc_1_itm[11]) , reg_deltay_square_blue_acc_psp_sva_tmp},
            or_13_cse))}, main_stage_0_3);
      end
    end
  end
  assign nl_mul_7_itm_1  = conv_u2u_3_27(gauss_blur_val_2_sva[29:27]) * 27'b111000111000111000111001;
  assign nl_mul_6_itm_1  = conv_u2u_3_24(gauss_blur_val_2_sva[26:24]) * 24'b111000111000111000111;
  assign nl_mul_5_itm_1  = conv_u2u_3_21(gauss_blur_val_2_sva[23:21]) * 21'b111000111000111001;
  assign nl_mul_4_itm_1  = conv_u2u_3_18(gauss_blur_val_2_sva[20:18]) * 18'b111000111000111;
  assign nl_mul_3_itm_1  = conv_u2u_3_15(gauss_blur_val_2_sva[17:15]) * 15'b111000111001;
  assign nl_mul_2_itm_1  = conv_u2u_3_12(gauss_blur_val_2_sva[14:12]) * 12'b111000111;
  assign nl_mul_1_itm_1  = conv_u2u_3_9(gauss_blur_val_2_sva[11:9]) * 9'b111001;

  function [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_6_1_5;
    input [5:0] vector;
    reg [5:0] tmp;
  begin
    tmp = vector >> 5;
    readslicef_6_1_5 = tmp[0:0];
  end
  endfunction


  function [3:0] MUX_v_4_2_2;
    input [7:0] inputs;
    input [0:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[7:4];
      end
      1'b1 : begin
        result = inputs[3:0];
      end
      default : begin
        result = inputs[7:4];
      end
    endcase
    MUX_v_4_2_2 = result;
  end
  endfunction


  function [0:0] readslicef_11_1_10;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 10;
    readslicef_11_1_10 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_8_1_7;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_8_1_7 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
  end
  endfunction


  function [9:0] MUX_v_10_2_2;
    input [19:0] inputs;
    input [0:0] sel;
    reg [9:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[19:10];
      end
      1'b1 : begin
        result = inputs[9:0];
      end
      default : begin
        result = inputs[19:10];
      end
    endcase
    MUX_v_10_2_2 = result;
  end
  endfunction


  function [2:0] readslicef_4_3_1;
    input [3:0] vector;
    reg [3:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_4_3_1 = tmp[2:0];
  end
  endfunction


  function [1:0] readslicef_3_2_1;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_3_2_1 = tmp[1:0];
  end
  endfunction


  function [5:0] readslicef_7_6_1;
    input [6:0] vector;
    reg [6:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_7_6_1 = tmp[5:0];
  end
  endfunction


  function [7:0] readslicef_9_8_1;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_9_8_1 = tmp[7:0];
  end
  endfunction


  function [3:0] readslicef_5_4_1;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_5_4_1 = tmp[3:0];
  end
  endfunction


  function [0:0] readslicef_2_1_1;
    input [1:0] vector;
    reg [1:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_2_1_1 = tmp[0:0];
  end
  endfunction


  function [29:0] MUX_v_30_2_2;
    input [59:0] inputs;
    input [0:0] sel;
    reg [29:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[59:30];
      end
      1'b1 : begin
        result = inputs[29:0];
      end
      default : begin
        result = inputs[59:30];
      end
    endcase
    MUX_v_30_2_2 = result;
  end
  endfunction


  function [0:0] MUX_s_1_2_2;
    input [1:0] inputs;
    input [0:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[1:1];
      end
      1'b1 : begin
        result = inputs[0:0];
      end
      default : begin
        result = inputs[1:1];
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function [9:0] signext_10_1;
    input [0:0] vector;
  begin
    signext_10_1= {{9{vector[0]}}, vector};
  end
  endfunction


  function [3:0] MUX1HOT_v_4_3_2;
    input [11:0] inputs;
    input [2:0] sel;
    reg [3:0] result;
    integer i;
  begin
    result = inputs[0+:4] & {4{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*4+:4] & {4{sel[i]}});
    MUX1HOT_v_4_3_2 = result;
  end
  endfunction


  function [4:0] readslicef_6_5_1;
    input [5:0] vector;
    reg [5:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_6_5_1 = tmp[4:0];
  end
  endfunction


  function  [4:0] conv_s2u_4_5 ;
    input signed [3:0]  vector ;
  begin
    conv_s2u_4_5 = {vector[3], vector};
  end
  endfunction


  function signed [5:0] conv_s2s_5_6 ;
    input signed [4:0]  vector ;
  begin
    conv_s2s_5_6 = {vector[4], vector};
  end
  endfunction


  function  [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function signed [11:0] conv_u2s_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2s_11_12 = {1'b0, vector};
  end
  endfunction


  function  [3:0] conv_s2u_3_4 ;
    input signed [2:0]  vector ;
  begin
    conv_s2u_3_4 = {vector[2], vector};
  end
  endfunction


  function signed [3:0] conv_u2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_4 = {1'b0, vector};
  end
  endfunction


  function  [2:0] conv_u2u_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_3 = {1'b0, vector};
  end
  endfunction


  function signed [3:0] conv_s2s_3_4 ;
    input signed [2:0]  vector ;
  begin
    conv_s2s_3_4 = {vector[2], vector};
  end
  endfunction


  function signed [5:0] conv_u2s_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2s_5_6 = {1'b0, vector};
  end
  endfunction


  function signed [6:0] conv_u2s_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2s_6_7 = {1'b0, vector};
  end
  endfunction


  function signed [6:0] conv_s2s_6_7 ;
    input signed [5:0]  vector ;
  begin
    conv_s2s_6_7 = {vector[5], vector};
  end
  endfunction


  function signed [10:0] conv_u2s_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2s_10_11 = {1'b0, vector};
  end
  endfunction


  function  [28:0] conv_s2u_28_29 ;
    input signed [27:0]  vector ;
  begin
    conv_s2u_28_29 = {vector[27], vector};
  end
  endfunction


  function signed [27:0] conv_u2s_27_28 ;
    input [26:0]  vector ;
  begin
    conv_u2s_27_28 = {1'b0, vector};
  end
  endfunction


  function signed [27:0] conv_s2s_25_28 ;
    input signed [24:0]  vector ;
  begin
    conv_s2s_25_28 = {{3{vector[24]}}, vector};
  end
  endfunction


  function signed [24:0] conv_u2s_24_25 ;
    input [23:0]  vector ;
  begin
    conv_u2s_24_25 = {1'b0, vector};
  end
  endfunction


  function signed [24:0] conv_s2s_22_25 ;
    input signed [21:0]  vector ;
  begin
    conv_s2s_22_25 = {{3{vector[21]}}, vector};
  end
  endfunction


  function signed [21:0] conv_u2s_21_22 ;
    input [20:0]  vector ;
  begin
    conv_u2s_21_22 = {1'b0, vector};
  end
  endfunction


  function signed [21:0] conv_s2s_19_22 ;
    input signed [18:0]  vector ;
  begin
    conv_s2s_19_22 = {{3{vector[18]}}, vector};
  end
  endfunction


  function signed [18:0] conv_u2s_18_19 ;
    input [17:0]  vector ;
  begin
    conv_u2s_18_19 = {1'b0, vector};
  end
  endfunction


  function signed [18:0] conv_s2s_16_19 ;
    input signed [15:0]  vector ;
  begin
    conv_s2s_16_19 = {{3{vector[15]}}, vector};
  end
  endfunction


  function signed [15:0] conv_u2s_15_16 ;
    input [14:0]  vector ;
  begin
    conv_u2s_15_16 = {1'b0, vector};
  end
  endfunction


  function signed [15:0] conv_s2s_13_16 ;
    input signed [12:0]  vector ;
  begin
    conv_s2s_13_16 = {{3{vector[12]}}, vector};
  end
  endfunction


  function signed [12:0] conv_u2s_12_13 ;
    input [11:0]  vector ;
  begin
    conv_u2s_12_13 = {1'b0, vector};
  end
  endfunction


  function signed [12:0] conv_s2s_10_13 ;
    input signed [9:0]  vector ;
  begin
    conv_s2s_10_13 = {{3{vector[9]}}, vector};
  end
  endfunction


  function signed [9:0] conv_u2s_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2s_9_10 = {1'b0, vector};
  end
  endfunction


  function signed [9:0] conv_s2s_8_10 ;
    input signed [7:0]  vector ;
  begin
    conv_s2s_8_10 = {{2{vector[7]}}, vector};
  end
  endfunction


  function signed [8:0] conv_u2s_7_9 ;
    input [6:0]  vector ;
  begin
    conv_u2s_7_9 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [8:0] conv_s2s_6_9 ;
    input signed [5:0]  vector ;
  begin
    conv_s2s_6_9 = {{3{vector[5]}}, vector};
  end
  endfunction


  function  [3:0] conv_s2u_1_4 ;
    input signed [0:0]  vector ;
  begin
    conv_s2u_1_4 = {{3{vector[0]}}, vector};
  end
  endfunction


  function  [28:0] conv_u2u_2_29 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_29 = {{27{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_7 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_6 = {1'b0, vector};
  end
  endfunction


  function  [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
  end
  endfunction


  function  [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_4_6 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_6 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_5_7 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_7 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [31:0] conv_u2u_31_32 ;
    input [30:0]  vector ;
  begin
    conv_u2u_31_32 = {1'b0, vector};
  end
  endfunction


  function  [30:0] conv_u2u_30_31 ;
    input [29:0]  vector ;
  begin
    conv_u2u_30_31 = {1'b0, vector};
  end
  endfunction


  function  [31:0] conv_u2u_30_32 ;
    input [29:0]  vector ;
  begin
    conv_u2u_30_32 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [4:0] conv_s2u_3_5 ;
    input signed [2:0]  vector ;
  begin
    conv_s2u_3_5 = {{2{vector[2]}}, vector};
  end
  endfunction


  function signed [4:0] conv_u2s_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_5 = {1'b0, vector};
  end
  endfunction


  function  [1:0] conv_u2u_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_2 = {1'b0, vector};
  end
  endfunction


  function  [26:0] conv_u2u_3_27 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_27 = {{24{1'b0}}, vector};
  end
  endfunction


  function  [23:0] conv_u2u_3_24 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_24 = {{21{1'b0}}, vector};
  end
  endfunction


  function  [20:0] conv_u2u_3_21 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_21 = {{18{1'b0}}, vector};
  end
  endfunction


  function  [17:0] conv_u2u_3_18 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_18 = {{15{1'b0}}, vector};
  end
  endfunction


  function  [14:0] conv_u2u_3_15 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_15 = {{12{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_3_12 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_12 = {{9{1'b0}}, vector};
  end
  endfunction


  function  [8:0] conv_u2u_3_9 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_9 = {{6{1'b0}}, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    gauss_blur
//  Generated from file(s):
//    2) $PROJECT_HOME/../gauss_blur_source/gauss_blur.c
// ------------------------------------------------------------------


module gauss_blur (
  vin, vout_rsc_z, vga_xy, volume_rsc_z, clk, en, arst_n
);
  input [89:0] vin;
  output [29:0] vout_rsc_z;
  input [19:0] vga_xy;
  output [3:0] volume_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [29:0] vout_rsc_mgc_out_stdreg_d;
  wire [3:0] volume_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_out_stdreg #(.rscid(2),
  .width(30)) vout_rsc_mgc_out_stdreg (
      .d(vout_rsc_mgc_out_stdreg_d),
      .z(vout_rsc_z)
    );
  mgc_out_stdreg #(.rscid(4),
  .width(4)) volume_rsc_mgc_out_stdreg (
      .d(volume_rsc_mgc_out_stdreg_d),
      .z(volume_rsc_z)
    );
  gauss_blur_core gauss_blur_core_inst (
      .vin(vin),
      .vga_xy(vga_xy),
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vout_rsc_mgc_out_stdreg_d(vout_rsc_mgc_out_stdreg_d),
      .volume_rsc_mgc_out_stdreg_d(volume_rsc_mgc_out_stdreg_d)
    );
endmodule



