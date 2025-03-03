// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   gsp14@EEWS305-036
//  Generated date: Sat May 07 13:33:59 2016
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    sobel_filter_bw_core
// ------------------------------------------------------------------


module sobel_filter_bw_core (
  vin, clk, en, arst_n, vout_rsc_mgc_out_stdreg_d
);
  input [89:0] vin;
  input clk;
  input en;
  input arst_n;
  output [29:0] vout_rsc_mgc_out_stdreg_d;
  reg [29:0] vout_rsc_mgc_out_stdreg_d;



  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : core
    // Interconnect Declarations
    reg [89:0] regs_regs_1_sva;
    reg [89:0] regs_regs_0_sva;
    reg [11:0] acc_psp_1_sva;
    reg [3:0] acc_1_psp_1_sva;
    reg [2:0] acc_imod_8_sva;
    reg [11:0] ACC1_1_acc_15_psp_sva;
    reg [11:0] acc_4_psp_1_sva;
    reg [3:0] acc_5_psp_1_sva;
    reg [2:0] acc_imod_10_sva;
    reg [11:0] acc_8_psp_1_sva;
    reg [3:0] acc_9_psp_1_sva;
    reg [2:0] acc_imod_12_sva;
    reg [11:0] ACC1_1_acc_18_psp_sva;
    reg [11:0] acc_psp_2_sva;
    reg [3:0] acc_1_psp_2_sva;
    reg [2:0] acc_imod_9_sva;
    reg [11:0] acc_8_psp_2_sva;
    reg [3:0] acc_9_psp_2_sva;
    reg [2:0] acc_imod_13_sva;
    reg [11:0] acc_psp_sva;
    reg [3:0] acc_1_psp_sva;
    reg [2:0] acc_imod_1_sva;
    reg [11:0] ACC1_3_acc_15_psp_sva;
    reg [11:0] acc_4_psp_sva;
    reg [3:0] acc_5_psp_sva;
    reg [2:0] acc_imod_4_sva;
    reg [11:0] acc_8_psp_sva;
    reg [3:0] acc_9_psp_sva;
    reg [2:0] acc_imod_7_sva;
    reg [11:0] ACC1_3_acc_18_psp_sva;
    reg [13:0] ACC1_acc_psp_sva;
    reg [12:0] abs_din_2_sva_1;
    reg slc_svs;
    reg val_sg4_lpi_1_dfm;
    reg val_1_lpi_1_dfm_1;
    reg [13:0] acc_12_psp;
    reg [12:0] ACC1_acc_141_itm_1;
    reg [12:0] MAC2_acc_50_itm_1;
    reg [9:0] MAC2_mul_5_itm_1;
    reg [7:0] MAC2_mul_7_itm_1;
    reg ACC1_1_slc_acc_idiv_1_48_itm_1;
    reg main_stage_0_2;
    reg [12:0] MAC2_acc_86_psp;
    reg [12:0] abs_1_mux_2;
    reg [11:0] ACC1_acc_140_itm_1_sg1;
    reg ACC1_acc_140_itm_2;
    reg [9:0] MAC2_acc_45_itm_1_sg1;

    reg[12:0] abs_mux_1_nl;
    begin : core_rlpExit
      forever begin : core_rlp
        // C-Step 0 of Loop 'core_rlp'
        regs_regs_1_sva = 90'b0;
        regs_regs_0_sva = 90'b0;
        main_stage_0_2 = 1'b0;
        begin : mainExit
          forever begin : main
            // C-Step 0 of Loop 'main'
            begin : waitLoop0Exit
              forever begin : waitLoop0
                @(posedge clk or negedge ( arst_n ));
                if ( ~ arst_n )
                  disable core_rlpExit;
                if ( en )
                  disable waitLoop0Exit;
              end
            end
            // C-Step 1 of Loop 'main'
            if ( main_stage_0_2 ) begin
              abs_din_2_sva_1 = 13'b0;
              ACC1_acc_psp_sva = conv_s2s_13_14(ACC1_acc_141_itm_1) + conv_s2s_13_14({ACC1_acc_140_itm_1_sg1
                  , ACC1_acc_140_itm_2});
              MAC2_acc_86_psp = conv_s2u_10_13(MAC2_acc_45_itm_1_sg1) + conv_s2u_10_13(MAC2_mul_5_itm_1)
                  + conv_s2u_11_13({MAC2_mul_7_itm_1 , 1'b0 , ({{1{ACC1_1_slc_acc_idiv_1_48_itm_1}},
                  ACC1_1_slc_acc_idiv_1_48_itm_1})}) + conv_s2u_12_13(MAC2_acc_50_itm_1[12:1]);
              if ( ACC1_acc_psp_sva[13] ) begin
                abs_din_2_sva_1 = (~ (ACC1_acc_psp_sva[12:0])) + 13'b1;
              end
              if ( MAC2_acc_86_psp[12] ) begin
                abs_1_mux_2 = ({(~ (MAC2_acc_86_psp[11:0])) , (~ (MAC2_acc_50_itm_1[0]))})
                    + 13'b1;
              end
              else begin
                abs_1_mux_2 = {(MAC2_acc_86_psp[11:0]) , (MAC2_acc_50_itm_1[0])};
              end
              abs_mux_1_nl = MUX_v_13_2_2({(ACC1_acc_psp_sva[12:0]) , abs_din_2_sva_1},
                  ACC1_acc_psp_sva[13]);
              acc_12_psp = conv_u2u_13_14(abs_mux_1_nl) + conv_u2u_13_14(abs_1_mux_2);
              slc_svs = readslicef_5_1_4(((acc_12_psp[13:9]) + 5'b11111));
              val_sg4_lpi_1_dfm = (acc_12_psp[9]) | (~ slc_svs);
              val_1_lpi_1_dfm_1 = ((acc_12_psp[0]) | (~ slc_svs)) & val_sg4_lpi_1_dfm;
              vout_rsc_mgc_out_stdreg_d <= {({{9{val_1_lpi_1_dfm_1}}, val_1_lpi_1_dfm_1})
                  , (signext_4_1(((acc_12_psp[6]) | (~ slc_svs)) & val_sg4_lpi_1_dfm))
                  , ({{5{val_1_lpi_1_dfm_1}}, val_1_lpi_1_dfm_1}) , ({{9{val_1_lpi_1_dfm_1}},
                  val_1_lpi_1_dfm_1})};
              regs_regs_0_sva = vin;
            end
            acc_psp_1_sva = conv_u2u_11_12(conv_u2u_10_11(vin[79:70]) + conv_u2u_10_11(vin[69:60]))
                + conv_u2u_10_12(vin[89:80]);
            acc_1_psp_1_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_psp_1_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_psp_1_sva[4]) ,
                (acc_psp_1_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_psp_1_sva[5])) , 1'b1}) + conv_u2u_2_3({(acc_psp_1_sva[6]) ,
                (~ (acc_psp_1_sva[7]))})))) , (acc_psp_1_sva[10])})))) , 1'b1}) +
                conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_psp_1_sva[1]))
                , 1'b1}) + conv_u2u_2_3({(acc_psp_1_sva[2]) , (~ (acc_psp_1_sva[9]))}))))
                , (~ (acc_psp_1_sva[11]))})))) + ({3'b101 , (acc_psp_1_sva[0])});
            acc_imod_8_sva = conv_s2s_2_3(conv_s2s_1_2(acc_1_psp_1_sva[1]) + conv_u2s_1_2(acc_1_psp_1_sva[0]))
                + conv_s2s_2_3(acc_1_psp_1_sva[3:2]);
            ACC1_1_acc_15_psp_sva = conv_u2s_10_12({(acc_psp_1_sva[11]) , (conv_u2u_8_9({(acc_psp_1_sva[11])
                , 1'b0 , (acc_psp_1_sva[11]) , 1'b0 , (acc_psp_1_sva[11]) , 1'b0
                , (signext_2_1(acc_psp_1_sva[7]))}) + conv_u2u_8_9(readslicef_9_8_1((({(acc_psp_1_sva[9])
                , 1'b0 , (acc_psp_1_sva[9]) , 1'b0 , (acc_psp_1_sva[9]) , 1'b0 ,
                (signext_2_1(acc_psp_1_sva[5])) , 1'b1}) + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_psp_1_sva[7])
                , 1'b0 , (acc_psp_1_sva[5]) , 1'b0 , (signext_2_1(acc_psp_1_sva[9]))
                , 1'b1}) + conv_u2u_6_8({(acc_psp_1_sva[6]) , 1'b0 , (acc_psp_1_sva[6])
                , 1'b0 , (acc_psp_1_sva[6]) , (acc_imod_8_sva[1])})))) , (~ (readslicef_3_1_2((({1'b1
                , (acc_imod_8_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_8_sva[1]))
                , (~ (acc_imod_8_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(acc_psp_1_sva[10])
                , 1'b0 , (acc_psp_1_sva[10]) , 1'b0 , (acc_psp_1_sva[10]) , 1'b0
                , (acc_psp_1_sva[10]) , 1'b0 , (acc_psp_1_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(acc_psp_1_sva[8])
                , 1'b0 , (acc_psp_1_sva[8]) , 1'b0 , (acc_psp_1_sva[8]) , 1'b0 ,
                (acc_psp_1_sva[8]) , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((conv_u2s_3_4({(acc_psp_1_sva[3])
                , (acc_psp_1_sva[1]) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_psp_1_sva[2])
                , (acc_psp_1_sva[3])})))) , 1'b1}) + conv_s2s_3_5({(acc_1_psp_1_sva[3:2])
                , (acc_psp_1_sva[4])})))) , 1'b1}) + conv_u2s_5_7({(acc_psp_1_sva[7])
                , (acc_psp_1_sva[4]) , (signext_2_1(acc_psp_1_sva[11])) , (acc_1_psp_1_sva[1])}))))
                , (~ (acc_imod_8_sva[2]))})))));
            acc_4_psp_1_sva = conv_u2u_11_12(conv_u2u_10_11(vin[49:40]) + conv_u2u_10_11(vin[39:30]))
                + conv_u2u_10_12(vin[59:50]);
            acc_5_psp_1_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_4_psp_1_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_4_psp_1_sva[4])
                , (acc_4_psp_1_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_4_psp_1_sva[5])) , 1'b1}) + conv_u2u_2_3({(acc_4_psp_1_sva[6])
                , (~ (acc_4_psp_1_sva[7]))})))) , (acc_4_psp_1_sva[10])})))) , 1'b1})
                + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_4_psp_1_sva[1]))
                , 1'b1}) + conv_u2u_2_3({(acc_4_psp_1_sva[2]) , (~ (acc_4_psp_1_sva[9]))}))))
                , (~ (acc_4_psp_1_sva[11]))})))) + ({3'b101 , (acc_4_psp_1_sva[0])});
            acc_imod_10_sva = conv_s2s_2_3(conv_s2s_1_2(acc_5_psp_1_sva[1]) + conv_u2s_1_2(acc_5_psp_1_sva[0]))
                + conv_s2s_2_3(acc_5_psp_1_sva[3:2]);
            acc_8_psp_1_sva = conv_u2u_11_12(conv_u2u_10_11(vin[19:10]) + conv_u2u_10_11(vin[9:0]))
                + conv_u2u_10_12(vin[29:20]);
            acc_9_psp_1_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_8_psp_1_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_8_psp_1_sva[4])
                , (acc_8_psp_1_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_8_psp_1_sva[5])) , 1'b1}) + conv_u2u_2_3({(acc_8_psp_1_sva[6])
                , (~ (acc_8_psp_1_sva[7]))})))) , (acc_8_psp_1_sva[10])})))) , 1'b1})
                + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_8_psp_1_sva[1]))
                , 1'b1}) + conv_u2u_2_3({(acc_8_psp_1_sva[2]) , (~ (acc_8_psp_1_sva[9]))}))))
                , (~ (acc_8_psp_1_sva[11]))})))) + ({3'b101 , (acc_8_psp_1_sva[0])});
            acc_imod_12_sva = conv_s2s_2_3(conv_s2s_1_2(acc_9_psp_1_sva[1]) + conv_u2s_1_2(acc_9_psp_1_sva[0]))
                + conv_s2s_2_3(acc_9_psp_1_sva[3:2]);
            ACC1_1_acc_18_psp_sva = conv_u2s_10_12({(acc_8_psp_1_sva[11]) , (conv_u2u_8_9({(acc_8_psp_1_sva[11])
                , 1'b0 , (acc_8_psp_1_sva[11]) , 1'b0 , (acc_8_psp_1_sva[11]) , 1'b0
                , (signext_2_1(acc_8_psp_1_sva[7]))}) + conv_u2u_8_9(readslicef_9_8_1((({(acc_8_psp_1_sva[9])
                , 1'b0 , (acc_8_psp_1_sva[9]) , 1'b0 , (acc_8_psp_1_sva[9]) , 1'b0
                , (signext_2_1(acc_8_psp_1_sva[5])) , 1'b1}) + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_8_psp_1_sva[7])
                , 1'b0 , (acc_8_psp_1_sva[5]) , 1'b0 , (signext_2_1(acc_8_psp_1_sva[9]))
                , 1'b1}) + conv_u2u_6_8({(acc_8_psp_1_sva[6]) , 1'b0 , (acc_8_psp_1_sva[6])
                , 1'b0 , (acc_8_psp_1_sva[6]) , (acc_imod_12_sva[1])})))) , (~ (readslicef_3_1_2((({1'b1
                , (acc_imod_12_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_12_sva[1]))
                , (~ (acc_imod_12_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(acc_8_psp_1_sva[10])
                , 1'b0 , (acc_8_psp_1_sva[10]) , 1'b0 , (acc_8_psp_1_sva[10]) , 1'b0
                , (acc_8_psp_1_sva[10]) , 1'b0 , (acc_8_psp_1_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(acc_8_psp_1_sva[8])
                , 1'b0 , (acc_8_psp_1_sva[8]) , 1'b0 , (acc_8_psp_1_sva[8]) , 1'b0
                , (acc_8_psp_1_sva[8]) , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((conv_u2s_3_4({(acc_8_psp_1_sva[3])
                , (acc_8_psp_1_sva[1]) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_8_psp_1_sva[2])
                , (acc_8_psp_1_sva[3])})))) , 1'b1}) + conv_s2s_3_5({(acc_9_psp_1_sva[3:2])
                , (acc_8_psp_1_sva[4])})))) , 1'b1}) + conv_u2s_5_7({(acc_8_psp_1_sva[7])
                , (acc_8_psp_1_sva[4]) , (signext_2_1(acc_8_psp_1_sva[11])) , (acc_9_psp_1_sva[1])}))))
                , (~ (acc_imod_12_sva[2]))})))));
            acc_psp_2_sva = conv_u2u_11_12(conv_u2u_10_11(regs_regs_0_sva[79:70])
                + conv_u2u_10_11(regs_regs_0_sva[69:60])) + conv_u2u_10_12(regs_regs_0_sva[89:80]);
            acc_1_psp_2_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_psp_2_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_psp_2_sva[4]) ,
                (acc_psp_2_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_psp_2_sva[5])) , 1'b1}) + conv_u2u_2_3({(acc_psp_2_sva[6]) ,
                (~ (acc_psp_2_sva[7]))})))) , (acc_psp_2_sva[10])})))) , 1'b1}) +
                conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_psp_2_sva[1]))
                , 1'b1}) + conv_u2u_2_3({(acc_psp_2_sva[2]) , (~ (acc_psp_2_sva[9]))}))))
                , (~ (acc_psp_2_sva[11]))})))) + ({3'b101 , (acc_psp_2_sva[0])});
            acc_imod_9_sva = conv_s2s_2_3(conv_s2s_1_2(acc_1_psp_2_sva[1]) + conv_u2s_1_2(acc_1_psp_2_sva[0]))
                + conv_s2s_2_3(acc_1_psp_2_sva[3:2]);
            acc_8_psp_2_sva = conv_u2u_11_12(conv_u2u_10_11(regs_regs_0_sva[19:10])
                + conv_u2u_10_11(regs_regs_0_sva[9:0])) + conv_u2u_10_12(regs_regs_0_sva[29:20]);
            acc_9_psp_2_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_8_psp_2_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_8_psp_2_sva[4])
                , (acc_8_psp_2_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_8_psp_2_sva[5])) , 1'b1}) + conv_u2u_2_3({(acc_8_psp_2_sva[6])
                , (~ (acc_8_psp_2_sva[7]))})))) , (acc_8_psp_2_sva[10])})))) , 1'b1})
                + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_8_psp_2_sva[1]))
                , 1'b1}) + conv_u2u_2_3({(acc_8_psp_2_sva[2]) , (~ (acc_8_psp_2_sva[9]))}))))
                , (~ (acc_8_psp_2_sva[11]))})))) + ({3'b101 , (acc_8_psp_2_sva[0])});
            acc_imod_13_sva = conv_s2s_2_3(conv_s2s_1_2(acc_9_psp_2_sva[1]) + conv_u2s_1_2(acc_9_psp_2_sva[0]))
                + conv_s2s_2_3(acc_9_psp_2_sva[3:2]);
            acc_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[79:70]) +
                conv_u2u_10_11(regs_regs_1_sva[69:60])) + conv_u2u_10_12(regs_regs_1_sva[89:80]);
            acc_1_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_psp_sva[4]) , (acc_psp_sva[8])}))))
                , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_psp_sva[5]))
                , 1'b1}) + conv_u2u_2_3({(acc_psp_sva[6]) , (~ (acc_psp_sva[7]))}))))
                , (acc_psp_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_psp_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_psp_sva[2]) , (~
                (acc_psp_sva[9]))})))) , (~ (acc_psp_sva[11]))})))) + ({3'b101 ,
                (acc_psp_sva[0])});
            acc_imod_1_sva = conv_s2s_2_3(conv_s2s_1_2(acc_1_psp_sva[1]) + conv_u2s_1_2(acc_1_psp_sva[0]))
                + conv_s2s_2_3(acc_1_psp_sva[3:2]);
            ACC1_3_acc_15_psp_sva = conv_u2s_10_12({(acc_psp_sva[11]) , (conv_u2u_8_9({(acc_psp_sva[11])
                , 1'b0 , (acc_psp_sva[11]) , 1'b0 , (acc_psp_sva[11]) , 1'b0 , (signext_2_1(acc_psp_sva[7]))})
                + conv_u2u_8_9(readslicef_9_8_1((({(acc_psp_sva[9]) , 1'b0 , (acc_psp_sva[9])
                , 1'b0 , (acc_psp_sva[9]) , 1'b0 , (signext_2_1(acc_psp_sva[5]))
                , 1'b1}) + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_psp_sva[7])
                , 1'b0 , (acc_psp_sva[5]) , 1'b0 , (signext_2_1(acc_psp_sva[9]))
                , 1'b1}) + conv_u2u_6_8({(acc_psp_sva[6]) , 1'b0 , (acc_psp_sva[6])
                , 1'b0 , (acc_psp_sva[6]) , (acc_imod_1_sva[1])})))) , (~ (readslicef_3_1_2((({1'b1
                , (acc_imod_1_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_1_sva[1]))
                , (~ (acc_imod_1_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(acc_psp_sva[10])
                , 1'b0 , (acc_psp_sva[10]) , 1'b0 , (acc_psp_sva[10]) , 1'b0 , (acc_psp_sva[10])
                , 1'b0 , (acc_psp_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(acc_psp_sva[8])
                , 1'b0 , (acc_psp_sva[8]) , 1'b0 , (acc_psp_sva[8]) , 1'b0 , (acc_psp_sva[8])
                , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((conv_u2s_3_4({(acc_psp_sva[3])
                , (acc_psp_sva[1]) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_psp_sva[2])
                , (acc_psp_sva[3])})))) , 1'b1}) + conv_s2s_3_5({(acc_1_psp_sva[3:2])
                , (acc_psp_sva[4])})))) , 1'b1}) + conv_u2s_5_7({(acc_psp_sva[7])
                , (acc_psp_sva[4]) , (signext_2_1(acc_psp_sva[11])) , (acc_1_psp_sva[1])}))))
                , (~ (acc_imod_1_sva[2]))})))));
            acc_4_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[49:40])
                + conv_u2u_10_11(regs_regs_1_sva[39:30])) + conv_u2u_10_12(regs_regs_1_sva[59:50]);
            acc_5_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_4_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_4_psp_sva[4]) ,
                (acc_4_psp_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_4_psp_sva[5])) , 1'b1}) + conv_u2u_2_3({(acc_4_psp_sva[6]) ,
                (~ (acc_4_psp_sva[7]))})))) , (acc_4_psp_sva[10])})))) , 1'b1}) +
                conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_4_psp_sva[1]))
                , 1'b1}) + conv_u2u_2_3({(acc_4_psp_sva[2]) , (~ (acc_4_psp_sva[9]))}))))
                , (~ (acc_4_psp_sva[11]))})))) + ({3'b101 , (acc_4_psp_sva[0])});
            acc_imod_4_sva = conv_s2s_2_3(conv_s2s_1_2(acc_5_psp_sva[1]) + conv_u2s_1_2(acc_5_psp_sva[0]))
                + conv_s2s_2_3(acc_5_psp_sva[3:2]);
            acc_8_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[19:10])
                + conv_u2u_10_11(regs_regs_1_sva[9:0])) + conv_u2u_10_12(regs_regs_1_sva[29:20]);
            acc_9_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_8_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_8_psp_sva[4]) ,
                (acc_8_psp_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
                (acc_8_psp_sva[5])) , 1'b1}) + conv_u2u_2_3({(acc_8_psp_sva[6]) ,
                (~ (acc_8_psp_sva[7]))})))) , (acc_8_psp_sva[10])})))) , 1'b1}) +
                conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_8_psp_sva[1]))
                , 1'b1}) + conv_u2u_2_3({(acc_8_psp_sva[2]) , (~ (acc_8_psp_sva[9]))}))))
                , (~ (acc_8_psp_sva[11]))})))) + ({3'b101 , (acc_8_psp_sva[0])});
            acc_imod_7_sva = conv_s2s_2_3(conv_s2s_1_2(acc_9_psp_sva[1]) + conv_u2s_1_2(acc_9_psp_sva[0]))
                + conv_s2s_2_3(acc_9_psp_sva[3:2]);
            ACC1_3_acc_18_psp_sva = conv_u2s_10_12({(acc_8_psp_sva[11]) , (conv_u2u_8_9({(acc_8_psp_sva[11])
                , 1'b0 , (acc_8_psp_sva[11]) , 1'b0 , (acc_8_psp_sva[11]) , 1'b0
                , (signext_2_1(acc_8_psp_sva[7]))}) + conv_u2u_8_9(readslicef_9_8_1((({(acc_8_psp_sva[9])
                , 1'b0 , (acc_8_psp_sva[9]) , 1'b0 , (acc_8_psp_sva[9]) , 1'b0 ,
                (signext_2_1(acc_8_psp_sva[5])) , 1'b1}) + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_8_psp_sva[7])
                , 1'b0 , (acc_8_psp_sva[5]) , 1'b0 , (signext_2_1(acc_8_psp_sva[9]))
                , 1'b1}) + conv_u2u_6_8({(acc_8_psp_sva[6]) , 1'b0 , (acc_8_psp_sva[6])
                , 1'b0 , (acc_8_psp_sva[6]) , (acc_imod_7_sva[1])})))) , (~ (readslicef_3_1_2((({1'b1
                , (acc_imod_7_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_7_sva[1]))
                , (~ (acc_imod_7_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(acc_8_psp_sva[10])
                , 1'b0 , (acc_8_psp_sva[10]) , 1'b0 , (acc_8_psp_sva[10]) , 1'b0
                , (acc_8_psp_sva[10]) , 1'b0 , (acc_8_psp_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(acc_8_psp_sva[8])
                , 1'b0 , (acc_8_psp_sva[8]) , 1'b0 , (acc_8_psp_sva[8]) , 1'b0 ,
                (acc_8_psp_sva[8]) , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((conv_u2s_3_4({(acc_8_psp_sva[3])
                , (acc_8_psp_sva[1]) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_8_psp_sva[2])
                , (acc_8_psp_sva[3])})))) , 1'b1}) + conv_s2s_3_5({(acc_9_psp_sva[3:2])
                , (acc_8_psp_sva[4])})))) , 1'b1}) + conv_u2s_5_7({(acc_8_psp_sva[7])
                , (acc_8_psp_sva[4]) , (signext_2_1(acc_8_psp_sva[11])) , (acc_9_psp_sva[1])}))))
                , (~ (acc_imod_7_sva[2]))})))));
            regs_regs_1_sva = regs_regs_0_sva;
            ACC1_acc_141_itm_1 = ({(conv_s2u_11_12({conv_s2u_16_8(conv_s2s_2_8(conv_s2s_1_2(acc_8_psp_2_sva[11])
                + conv_u2s_1_2(acc_psp_2_sva[11])) * 8'b10101011) , 1'b0 , (signext_2_1(acc_8_psp_2_sva[11]))})
                + conv_s2u_11_12(~ (ACC1_1_acc_15_psp_sva[11:1]))) , (~ (ACC1_1_acc_15_psp_sva[0]))})
                + conv_s2s_12_13(ACC1_1_acc_18_psp_sva + (~ ACC1_3_acc_15_psp_sva));
            ACC1_acc_140_itm_2 = ACC1_3_acc_18_psp_sva[0];
            ACC1_acc_140_itm_1_sg1 = conv_u2u_1_12(acc_8_psp_2_sva[2]) + conv_u2u_1_12(acc_8_psp_2_sva[3])
                + conv_u2u_1_12(acc_8_psp_2_sva[4]) + conv_u2u_1_12(acc_psp_2_sva[3])
                + conv_u2u_1_12(~ (acc_psp_2_sva[4])) + conv_u2u_1_12(~ (acc_imod_9_sva[1]))
                + conv_u2u_1_12(acc_imod_9_sva[2]) + conv_u2u_1_12(readslicef_3_1_2((({1'b1
                , (acc_imod_9_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_9_sva[1]))
                , (~ (acc_imod_9_sva[2]))})))) + conv_u2u_1_12(acc_imod_13_sva[1])
                + conv_u2u_1_12(~ (acc_imod_13_sva[2])) + conv_u2u_1_12(~ (readslicef_3_1_2((({1'b1
                , (acc_imod_13_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_13_sva[1]))
                , (~ (acc_imod_13_sva[2]))}))))) + conv_u2u_1_12(~ (acc_1_psp_2_sva[1]))
                + conv_u2u_1_12(acc_9_psp_2_sva[1]) + conv_s2u_2_12(~ (acc_1_psp_2_sva[3:2]))
                + conv_s2u_2_12(acc_9_psp_2_sva[3:2]) + conv_u2u_2_12(signext_2_1(acc_8_psp_2_sva[7]))
                + conv_u2u_2_12(signext_2_1(~ (acc_psp_2_sva[5]))) + conv_u2u_2_12(signext_2_1(~
                (acc_psp_2_sva[7]))) + conv_u2u_2_12(signext_2_1(~ (acc_psp_2_sva[9])))
                + conv_u2u_2_12({(acc_8_psp_2_sva[3]) , (acc_8_psp_2_sva[1])}) +
                conv_u2u_4_12({(acc_8_psp_2_sva[7]) , (acc_8_psp_2_sva[4]) , (signext_2_1(acc_8_psp_2_sva[5]))})
                + conv_u2u_4_12({(~ (acc_psp_2_sva[7])) , (~ (acc_psp_2_sva[3]))
                , 1'b1 , (~ (acc_psp_2_sva[1]))}) + conv_s2u_12_12(conv_s2s_2_6(conv_s2s_1_2(acc_8_psp_2_sva[6])
                + conv_u2s_1_2(acc_psp_2_sva[6])) * 6'b101011) + conv_u2u_6_12({(acc_8_psp_2_sva[7])
                , 1'b0 , (acc_8_psp_2_sva[5]) , 1'b0 , (signext_2_1(acc_8_psp_2_sva[9]))})
                + conv_u2u_6_12({(~ (acc_psp_2_sva[7])) , 1'b1 , (~ (acc_psp_2_sva[5:4]))
                , 1'b1 , (~ (acc_psp_2_sva[2]))}) + conv_s2u_8_12(conv_s2u_16_8(conv_s2s_2_8(conv_s2s_1_2(acc_8_psp_2_sva[8])
                + conv_u2s_1_2(acc_psp_2_sva[8])) * 8'b10101011)) + conv_s2u_9_12({conv_s2u_12_6(conv_s2s_2_6(conv_s2s_1_2(acc_8_psp_2_sva[9])
                + conv_u2s_1_2(acc_psp_2_sva[9])) * 6'b101011) , 1'b0 , (signext_2_1(~
                (acc_psp_2_sva[11])))}) + conv_s2u_10_12(conv_s2u_20_10(conv_s2s_2_10(conv_s2s_1_2(acc_8_psp_2_sva[10])
                + conv_u2s_1_2(acc_psp_2_sva[10])) * 10'b1010101011)) + conv_s2u_11_12(ACC1_3_acc_18_psp_sva[11:1])
                + 12'b111110100011;
            MAC2_acc_50_itm_1 = (conv_s2s_12_13(ACC1_1_acc_15_psp_sva) + conv_s2s_12_13(ACC1_1_acc_18_psp_sva))
                + (conv_s2s_12_13(~ ACC1_3_acc_15_psp_sva) + conv_s2s_12_13(~ ACC1_3_acc_18_psp_sva));
            MAC2_acc_45_itm_1_sg1 = conv_s2u_6_10(conv_s2u_12_6(conv_s2s_2_6(conv_s2s_1_2(acc_4_psp_sva[6])
                + conv_u2s_1_2(acc_4_psp_1_sva[6])) * 6'b10101)) + conv_u2u_6_10({(acc_4_psp_1_sva[7])
                , 1'b0 , (acc_4_psp_1_sva[5]) , 1'b0 , (signext_2_1(acc_4_psp_1_sva[7]))})
                + conv_s2u_8_10(conv_s2u_16_8(conv_s2s_2_8(conv_s2s_1_2(acc_4_psp_sva[8])
                + conv_u2s_1_2(acc_4_psp_1_sva[8])) * 8'b1010101)) + conv_s2u_9_10(conv_u2s_7_9(conv_u2u_1_7(~
                (acc_4_psp_sva[4])) + conv_u2u_1_7(acc_4_psp_1_sva[1]) + conv_u2u_1_7(acc_4_psp_1_sva[2])
                + conv_u2u_1_7(acc_4_psp_1_sva[3]) + conv_u2u_1_7(acc_4_psp_1_sva[4])
                + conv_u2u_1_7(acc_5_psp_1_sva[1]) + conv_u2u_1_7(acc_imod_10_sva[1])
                + conv_u2u_1_7(~ (acc_imod_10_sva[2])) + conv_u2u_1_7(~ (readslicef_3_1_2((({1'b1
                , (acc_imod_10_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_10_sva[1]))
                , (~ (acc_imod_10_sva[2]))}))))) + conv_u2u_1_7(~ (acc_5_psp_sva[1]))
                + conv_u2u_1_7(~ (acc_imod_4_sva[1])) + conv_u2u_1_7(acc_imod_4_sva[2])
                + conv_u2u_1_7(readslicef_3_1_2((({1'b1 , (acc_imod_4_sva[0]) , 1'b1})
                + conv_u2s_2_3({(~ (acc_imod_4_sva[1])) , (~ (acc_imod_4_sva[2]))}))))
                + conv_s2u_2_7(acc_5_psp_1_sva[3:2]) + conv_s2u_2_7(~ (acc_5_psp_sva[3:2]))
                + conv_u2u_2_7(signext_2_1(~ (acc_4_psp_sva[11]))) + conv_u2u_2_7(signext_2_1(~
                (acc_4_psp_sva[7]))) + conv_u2u_2_7(signext_2_1(~ (acc_4_psp_sva[9])))
                + conv_u2u_2_7(signext_2_1(acc_4_psp_1_sva[9])) + conv_u2u_2_7({(acc_4_psp_1_sva[3])
                , (acc_4_psp_sva[3])}) + conv_u2u_4_7({(~ (acc_4_psp_sva[7])) , (~
                (acc_4_psp_sva[3])) , 1'b1 , (~ (acc_4_psp_sva[1]))}) + conv_u2u_4_7({(acc_4_psp_1_sva[7])
                , (acc_4_psp_1_sva[4]) , (signext_2_1(~ (acc_4_psp_sva[5])))}) +
                conv_u2u_6_7({(~ (acc_4_psp_sva[7])) , 1'b1 , (~ (acc_4_psp_sva[5:4]))
                , 1'b1 , (~ (acc_4_psp_sva[2]))}) + 7'b1111100) + ({conv_u2u_12_6(conv_s2s_2_6(conv_s2s_1_2(acc_4_psp_sva[9])
                + conv_u2s_1_2(acc_4_psp_1_sva[9])) * 6'b10101) , 1'b0 , (signext_2_1(acc_4_psp_1_sva[11]))})
                + 9'b110100111);
            MAC2_mul_5_itm_1 = conv_s2u_20_10(conv_s2s_2_10(conv_s2s_1_2(acc_4_psp_sva[10])
                + conv_u2s_1_2(acc_4_psp_1_sva[10])) * 10'b101010101);
            MAC2_mul_7_itm_1 = conv_s2u_16_8(conv_s2s_2_8(conv_s2s_1_2(acc_4_psp_sva[11])
                + conv_u2s_1_2(acc_4_psp_1_sva[11])) * 8'b1010101);
            ACC1_1_slc_acc_idiv_1_48_itm_1 = acc_4_psp_1_sva[5];
            main_stage_0_2 = 1'b1;
          end
        end
      end
    end
    MAC2_acc_45_itm_1_sg1 = 10'b0;
    ACC1_acc_140_itm_2 = 1'b0;
    ACC1_acc_140_itm_1_sg1 = 12'b0;
    abs_1_mux_2 = 13'b0;
    MAC2_acc_86_psp = 13'b0;
    main_stage_0_2 = 1'b0;
    ACC1_1_slc_acc_idiv_1_48_itm_1 = 1'b0;
    MAC2_mul_7_itm_1 = 8'b0;
    MAC2_mul_5_itm_1 = 10'b0;
    MAC2_acc_50_itm_1 = 13'b0;
    ACC1_acc_141_itm_1 = 13'b0;
    acc_12_psp = 14'b0;
    val_1_lpi_1_dfm_1 = 1'b0;
    val_sg4_lpi_1_dfm = 1'b0;
    slc_svs = 1'b0;
    abs_din_2_sva_1 = 13'b0;
    ACC1_acc_psp_sva = 14'b0;
    ACC1_3_acc_18_psp_sva = 12'b0;
    acc_imod_7_sva = 3'b0;
    acc_9_psp_sva = 4'b0;
    acc_8_psp_sva = 12'b0;
    acc_imod_4_sva = 3'b0;
    acc_5_psp_sva = 4'b0;
    acc_4_psp_sva = 12'b0;
    ACC1_3_acc_15_psp_sva = 12'b0;
    acc_imod_1_sva = 3'b0;
    acc_1_psp_sva = 4'b0;
    acc_psp_sva = 12'b0;
    acc_imod_13_sva = 3'b0;
    acc_9_psp_2_sva = 4'b0;
    acc_8_psp_2_sva = 12'b0;
    acc_imod_9_sva = 3'b0;
    acc_1_psp_2_sva = 4'b0;
    acc_psp_2_sva = 12'b0;
    ACC1_1_acc_18_psp_sva = 12'b0;
    acc_imod_12_sva = 3'b0;
    acc_9_psp_1_sva = 4'b0;
    acc_8_psp_1_sva = 12'b0;
    acc_imod_10_sva = 3'b0;
    acc_5_psp_1_sva = 4'b0;
    acc_4_psp_1_sva = 12'b0;
    ACC1_1_acc_15_psp_sva = 12'b0;
    acc_imod_8_sva = 3'b0;
    acc_1_psp_1_sva = 4'b0;
    acc_psp_1_sva = 12'b0;
    regs_regs_0_sva = 90'b0;
    regs_regs_1_sva = 90'b0;
    vout_rsc_mgc_out_stdreg_d <= 30'b0;
  end


  function [12:0] MUX_v_13_2_2;
    input [25:0] inputs;
    input [0:0] sel;
    reg [12:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[25:13];
      end
      1'b1 : begin
        result = inputs[12:0];
      end
      default : begin
        result = inputs[25:13];
      end
    endcase
    MUX_v_13_2_2 = result;
  end
  endfunction


  function [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
  end
  endfunction


  function [3:0] signext_4_1;
    input [0:0] vector;
  begin
    signext_4_1= {{3{vector[0]}}, vector};
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


  function [1:0] signext_2_1;
    input [0:0] vector;
  begin
    signext_2_1= {{1{vector[0]}}, vector};
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


  function [6:0] readslicef_8_7_1;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_8_7_1 = tmp[6:0];
  end
  endfunction


  function [0:0] readslicef_3_1_2;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_3_1_2 = tmp[0:0];
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


  function signed [13:0] conv_s2s_13_14 ;
    input signed [12:0]  vector ;
  begin
    conv_s2s_13_14 = {vector[12], vector};
  end
  endfunction


  function  [12:0] conv_s2u_10_13 ;
    input signed [9:0]  vector ;
  begin
    conv_s2u_10_13 = {{3{vector[9]}}, vector};
  end
  endfunction


  function  [12:0] conv_s2u_11_13 ;
    input signed [10:0]  vector ;
  begin
    conv_s2u_11_13 = {{2{vector[10]}}, vector};
  end
  endfunction


  function  [12:0] conv_s2u_12_13 ;
    input signed [11:0]  vector ;
  begin
    conv_s2u_12_13 = {vector[11], vector};
  end
  endfunction


  function  [13:0] conv_u2u_13_14 ;
    input [12:0]  vector ;
  begin
    conv_u2u_13_14 = {1'b0, vector};
  end
  endfunction


  function  [11:0] conv_u2u_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2u_11_12 = {1'b0, vector};
  end
  endfunction


  function  [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction


  function  [11:0] conv_u2u_10_12 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_12 = {{2{1'b0}}, vector};
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


  function  [2:0] conv_u2u_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_3 = {1'b0, vector};
  end
  endfunction


  function  [4:0] conv_u2u_3_5 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_5 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [2:0] conv_s2s_2_3 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_3 = {vector[1], vector};
  end
  endfunction


  function signed [1:0] conv_s2s_1_2 ;
    input signed [0:0]  vector ;
  begin
    conv_s2s_1_2 = {vector[0], vector};
  end
  endfunction


  function signed [1:0] conv_u2s_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2s_1_2 = {1'b0, vector};
  end
  endfunction


  function signed [11:0] conv_u2s_10_12 ;
    input [9:0]  vector ;
  begin
    conv_u2s_10_12 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_u2u_6_8 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_8 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [2:0] conv_u2s_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2s_2_3 = {1'b0, vector};
  end
  endfunction


  function signed [11:0] conv_s2s_10_12 ;
    input signed [9:0]  vector ;
  begin
    conv_s2s_10_12 = {{2{vector[9]}}, vector};
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


  function signed [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 = {1'b0, vector};
  end
  endfunction


  function signed [8:0] conv_s2s_7_9 ;
    input signed [6:0]  vector ;
  begin
    conv_s2s_7_9 = {{2{vector[6]}}, vector};
  end
  endfunction


  function signed [6:0] conv_s2s_5_7 ;
    input signed [4:0]  vector ;
  begin
    conv_s2s_5_7 = {{2{vector[4]}}, vector};
  end
  endfunction


  function signed [4:0] conv_s2s_4_5 ;
    input signed [3:0]  vector ;
  begin
    conv_s2s_4_5 = {vector[3], vector};
  end
  endfunction


  function signed [3:0] conv_u2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_4 = {1'b0, vector};
  end
  endfunction


  function signed [3:0] conv_s2s_3_4 ;
    input signed [2:0]  vector ;
  begin
    conv_s2s_3_4 = {vector[2], vector};
  end
  endfunction


  function signed [4:0] conv_s2s_3_5 ;
    input signed [2:0]  vector ;
  begin
    conv_s2s_3_5 = {{2{vector[2]}}, vector};
  end
  endfunction


  function signed [6:0] conv_u2s_5_7 ;
    input [4:0]  vector ;
  begin
    conv_u2s_5_7 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_s2u_11_12 ;
    input signed [10:0]  vector ;
  begin
    conv_s2u_11_12 = {vector[10], vector};
  end
  endfunction


  function  [7:0] conv_s2u_16_8 ;
    input signed [15:0]  vector ;
  begin
    conv_s2u_16_8 = vector[7:0];
  end
  endfunction


  function signed [7:0] conv_s2s_2_8 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_8 = {{6{vector[1]}}, vector};
  end
  endfunction


  function signed [12:0] conv_s2s_12_13 ;
    input signed [11:0]  vector ;
  begin
    conv_s2s_12_13 = {vector[11], vector};
  end
  endfunction


  function  [11:0] conv_u2u_1_12 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_12 = {{11{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_s2u_2_12 ;
    input signed [1:0]  vector ;
  begin
    conv_s2u_2_12 = {{10{vector[1]}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_2_12 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_12 = {{10{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_4_12 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_12 = {{8{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_s2u_12_12 ;
    input signed [11:0]  vector ;
  begin
    conv_s2u_12_12 = vector;
  end
  endfunction


  function signed [5:0] conv_s2s_2_6 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_6 = {{4{vector[1]}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_6_12 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_12 = {{6{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_s2u_8_12 ;
    input signed [7:0]  vector ;
  begin
    conv_s2u_8_12 = {{4{vector[7]}}, vector};
  end
  endfunction


  function  [11:0] conv_s2u_9_12 ;
    input signed [8:0]  vector ;
  begin
    conv_s2u_9_12 = {{3{vector[8]}}, vector};
  end
  endfunction


  function  [5:0] conv_s2u_12_6 ;
    input signed [11:0]  vector ;
  begin
    conv_s2u_12_6 = vector[5:0];
  end
  endfunction


  function  [11:0] conv_s2u_10_12 ;
    input signed [9:0]  vector ;
  begin
    conv_s2u_10_12 = {{2{vector[9]}}, vector};
  end
  endfunction


  function  [9:0] conv_s2u_20_10 ;
    input signed [19:0]  vector ;
  begin
    conv_s2u_20_10 = vector[9:0];
  end
  endfunction


  function signed [9:0] conv_s2s_2_10 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_10 = {{8{vector[1]}}, vector};
  end
  endfunction


  function  [9:0] conv_s2u_6_10 ;
    input signed [5:0]  vector ;
  begin
    conv_s2u_6_10 = {{4{vector[5]}}, vector};
  end
  endfunction


  function  [9:0] conv_u2u_6_10 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_10 = {{4{1'b0}}, vector};
  end
  endfunction


  function  [9:0] conv_s2u_8_10 ;
    input signed [7:0]  vector ;
  begin
    conv_s2u_8_10 = {{2{vector[7]}}, vector};
  end
  endfunction


  function  [9:0] conv_s2u_9_10 ;
    input signed [8:0]  vector ;
  begin
    conv_s2u_9_10 = {vector[8], vector};
  end
  endfunction


  function signed [8:0] conv_u2s_7_9 ;
    input [6:0]  vector ;
  begin
    conv_u2s_7_9 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_1_7 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_7 = {{6{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_s2u_2_7 ;
    input signed [1:0]  vector ;
  begin
    conv_s2u_2_7 = {{5{vector[1]}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_2_7 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_7 = {{5{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_4_7 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_7 = {{3{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_7 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_12_6 ;
    input [11:0]  vector ;
  begin
    conv_u2u_12_6 = vector[5:0];
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    sobel_filter_bw
//  Generated from file(s):
//    2) $PROJECT_HOME/../sobel_filter_source_bw/blur_sob.c
// ------------------------------------------------------------------


module sobel_filter_bw (
  vin, vout_rsc_z, vga_xy, clk, en, arst_n
);
  input [89:0] vin;
  output [29:0] vout_rsc_z;
  input [19:0] vga_xy;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [29:0] vout_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_out_stdreg #(.rscid(2),
  .width(30)) vout_rsc_mgc_out_stdreg (
      .d(vout_rsc_mgc_out_stdreg_d),
      .z(vout_rsc_z)
    );
  sobel_filter_bw_core sobel_filter_bw_core_inst (
      .vin(vin),
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vout_rsc_mgc_out_stdreg_d(vout_rsc_mgc_out_stdreg_d)
    );
endmodule



