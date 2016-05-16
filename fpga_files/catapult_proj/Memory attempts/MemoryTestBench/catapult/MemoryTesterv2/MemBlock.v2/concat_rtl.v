
//------> ./rtl_mgc_ioport.v 
//------------------------------------------------------------------
//                M G C _ I O P O R T _ C O M P S
//------------------------------------------------------------------

//------------------------------------------------------------------
//                       M O D U L E S
//------------------------------------------------------------------

//------------------------------------------------------------------
//-- INPUT ENTITIES
//------------------------------------------------------------------

module mgc_in_wire (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] d;
  input  [width-1:0] z;

  wire   [width-1:0] d;

  assign d = z;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output [width-1:0] d;
  output             lz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;

  wire               vd;
  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;

endmodule
//------------------------------------------------------------------

module mgc_chan_in (ld, vd, d, lz, vz, z, size, req_size, sizez, sizelz);

  parameter integer rscid = 1;
  parameter integer width = 8;
  parameter integer sz_width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;
  output [sz_width-1:0] size;
  input              req_size;
  input  [sz_width-1:0] sizez;
  output             sizelz;


  wire               vd;
  wire   [width-1:0] d;
  wire               lz;
  wire   [sz_width-1:0] size;
  wire               sizelz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;
  assign size = sizez;
  assign sizelz = req_size;

endmodule


//------------------------------------------------------------------
//-- OUTPUT ENTITIES
//------------------------------------------------------------------

module mgc_out_stdreg (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input    [width-1:0] d;
  output   [width-1:0] z;

  wire     [width-1:0] z;

  assign z = d;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  input  [width-1:0] d;
  output             lz;
  output [width-1:0] z;

  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  input  [width-1:0] d;
  output             lz;
  input              vz;
  output [width-1:0] z;

  wire               vd;
  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;
  assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_out_prereg_en (ld, d, lz, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    wire               lz;
    wire   [width-1:0] z;

    assign z = d;
    assign lz = ld;

endmodule

//------------------------------------------------------------------
//-- INOUT ENTITIES
//------------------------------------------------------------------

module mgc_inout_stdreg_en (ldin, din, ldout, dout, lzin, lzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output [width-1:0] din;
    input              ldout;
    input  [width-1:0] dout;
    output             lzin;
    output             lzout;
    inout  [width-1:0] z;

    wire   [width-1:0] din;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign z = ldout ? dout : {width{1'bz}};

endmodule

//------------------------------------------------------------------
module hid_tribuf( I_SIG, ENABLE, O_SIG);
  parameter integer width = 8;

  input [width-1:0] I_SIG;
  input ENABLE;
  inout [width-1:0] O_SIG;

  assign O_SIG = (ENABLE) ? I_SIG : { width{1'bz}};

endmodule
//------------------------------------------------------------------

module mgc_inout_stdreg_wait (ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;
    wire   ldout_and_vzout;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign vdout = vzout ;
    assign ldout_and_vzout = ldout && vzout ;

    hid_tribuf #(width) tb( .I_SIG(dout),
                            .ENABLE(ldout_and_vzout),
                            .O_SIG(z) );

endmodule

//------------------------------------------------------------------

module mgc_inout_buf_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    hid_tribuf #(width) tb( .I_SIG(z_buf),
                            .ENABLE((lzout_buf && (!ldin) && vzout) ),
                            .O_SIG(z)  );

    mgc_out_buf_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFF
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );


endmodule

module mgc_inout_fifo_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer ph_log2 = 3;     // log2(fifo_sz)
    parameter integer pwropt  = 0;     // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               comb;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    assign comb = (lzout_buf && (!ldin) && vzout);

    hid_tribuf #(width) tb2( .I_SIG(z_buf), .ENABLE(comb), .O_SIG(z)  );

    mgc_out_fifo_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
    )
    FIFO
    (
        .clk   (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );

endmodule

//------------------------------------------------------------------
//-- I/O SYNCHRONIZATION ENTITIES
//------------------------------------------------------------------

module mgc_io_sync (ld, lz);

    input  ld;
    output lz;

    assign lz = ld;

endmodule

module mgc_bsync_rdy (rd, rz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 0;

    input  rd;
    output rz;

    wire   rz;

    assign rz = rd;

endmodule

module mgc_bsync_vld (vd, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 0;
    parameter valid = 1;

    output vd;
    input  vz;

    wire   vd;

    assign vd = vz;

endmodule

module mgc_bsync_rv (rd, vd, rz, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 1;

    input  rd;
    output vd;
    output rz;
    input  vz;

    wire   vd;
    wire   rz;

    assign rz = rd;
    assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_sync (ldin, vdin, ldout, vdout);

  input  ldin;
  output vdin;
  input  ldout;
  output vdout;

  wire   vdin;
  wire   vdout;

  assign vdin = ldout;
  assign vdout = ldin;

endmodule

///////////////////////////////////////////////////////////////////////////////
// dummy function used to preserve funccalls for modulario
// it looks like a memory read to the caller
///////////////////////////////////////////////////////////////////////////////
module funccall_inout (d, ad, bd, z, az, bz);

  parameter integer ram_id = 1;
  parameter integer width = 8;
  parameter integer addr_width = 8;

  output [width-1:0]       d;
  input  [addr_width-1:0]  ad;
  input                    bd;
  input  [width-1:0]       z;
  output [addr_width-1:0]  az;
  output                   bz;

  wire   [width-1:0]       d;
  wire   [addr_width-1:0]  az;
  wire                     bz;

  assign d  = z;
  assign az = ad;
  assign bz = bd;

endmodule


///////////////////////////////////////////////////////////////////////////////
// inlinable modular io not otherwise found in mgc_ioport
///////////////////////////////////////////////////////////////////////////////

module modulario_en_in (vd, d, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output             vd;
  output [width-1:0] d;
  input              vz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               vd;

  assign d = z;
  assign vd = vz;

endmodule

//------> ./rtl_mgc_ioport_v2001.v 
//------------------------------------------------------------------

module mgc_out_reg_pos (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(posedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(posedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg_neg (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(negedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(negedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg (clk, en, arst, srst, ld, d, lz, z); // Not Supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;


    generate
    if (ph_clk == 1'b0)
    begin: NEG_EDGE

        mgc_out_reg_neg
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_neg_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    else
    begin: POS_EDGE

        mgc_out_reg_pos
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_pos_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    endgenerate

endmodule




//------------------------------------------------------------------

module mgc_out_buf_wait (clk, en, arst, srst, ld, vd, d, vz, lz, z); // Not supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    output             vd;
    input  [width-1:0] d;
    output             lz;
    input              vz;
    output [width-1:0] z;

    wire               filled;
    wire               filled_next;
    wire   [width-1:0] abuf;
    wire               lbuf;


    assign filled_next = (filled & (~vz)) | (filled & ld) | (ld & (~vz));

    assign lbuf = ld & ~(filled ^ vz);

    assign vd = vz | ~filled;

    assign lz = ld | filled;

    assign z = (filled) ? abuf : d;

    wire dummy;
    wire dummy_bufreg_lz;

    // Output registers:
    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (1'b1),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    STATREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (filled_next),
        .d       (1'b0),       // input d is unused
        .lz      (filled),
        .z       (dummy)            // output z is unused
    );

    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (lbuf),
        .d       (d),
        .lz      (dummy_bufreg_lz),
        .z       (abuf)
    );

endmodule

//------------------------------------------------------------------

module mgc_out_fifo_wait (clk, en, arst, srst, ld, vd, d, lz, vz,  z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1; // clock enable polarity
    parameter         ph_arst = 1'b1; // async reset polarity
    parameter         ph_srst = 1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt


    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;

    wire    [31:0]      size;


      // Output registers:
 mgc_out_fifo_wait_core#(
        .rscid   (rscid),
        .width   (width),
        .sz_width (32),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
        ) CORE (
        .clk (clk),
        .en (en),
        .arst (arst),
        .srst (srst),
        .ld (ld),
        .vd (vd),
        .d (d),
        .lz (lz),
        .vz (vz),
        .z (z),
        .size (size)
        );

endmodule



module mgc_out_fifo_wait_core (clk, en, arst, srst, ld, vd, d, lz, vz,  z, size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // size of port for elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt

   localparam integer  fifo_b = width * fifo_sz;

    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;
    output    [sz_width-1:0]      size;

    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat_pre;
    wire     [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat;
    reg      [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff_pre;
    wire     [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff;
    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] en_l;
    reg      [(((fifo_sz > 0) ? fifo_sz : 1)-1)/8:0] en_l_s;

    reg       [width-1:0] buff_nxt;

    reg                   stat_nxt;
    reg                   stat_before;
    reg                   stat_after;
    reg                   en_l_var;

    integer               i;
    genvar                eni;

    wire [32:0]           size_t;
    reg [31:0]            count;
    reg [31:0]            count_t;
    reg [32:0]            n_elem;
// pragma translate_off
    reg [31:0]            peak;
// pragma translate_on

    wire [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] dummy_statreg_lz;
    wire [( (fifo_b > 0) ? fifo_b : 1)-1:0] dummy_bufreg_lz;

    generate
    if ( fifo_sz > 0 )
    begin: FIFO_REG
      assign vd = vz | ~stat[0];
      assign lz = ld | stat[fifo_sz-1];
      assign size_t = (count - (vz && stat[fifo_sz-1])) + ld;
      assign size = size_t[sz_width-1:0];
      assign z = (stat[fifo_sz-1]) ? buff[fifo_b-1:width*(fifo_sz-1)] : d;

      always @(*)
      begin: FIFOPROC
        n_elem = 33'b0;
        for (i = fifo_sz-1; i >= 0; i = i - 1)
        begin
          if (i != 0)
            stat_before = stat[i-1];
          else
            stat_before = 1'b0;

          if (i != (fifo_sz-1))
            stat_after = stat[i+1];
          else
            stat_after = 1'b1;

          stat_nxt = stat_after &
                    (stat_before | (stat[i] & (~vz)) | (stat[i] & ld) | (ld & (~vz)));

          stat_pre[i] = stat_nxt;
          en_l_var = 1'b1;
          if (!stat_nxt)
            begin
              buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end
          else if (vz && stat_before)
            buff_nxt[0+:width] = buff[width*(i-1)+:width];
          else if (ld && !((vz && stat_before) || ((!vz) && stat[i])))
            buff_nxt = d;
          else
            begin
              if (pwropt == 0)
                buff_nxt[0+:width] = buff[width*i+:width];
              else
                buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end

          if (ph_en != 0)
            en_l[i] = en & en_l_var;
          else
            en_l[i] = en | ~en_l_var;

          buff_pre[width*i+:width] = buff_nxt[0+:width];

          if ((stat_after == 1'b1) && (stat[i] == 1'b0))
            n_elem = ($unsigned(fifo_sz) - 1) - i;
        end

        if (ph_en != 0)
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b1;
        else
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b0;

        for (i = fifo_sz-1; i >= 7; i = i - 1)
        begin
          if ((i%'d2) == 0)
          begin
            if (ph_en != 0)
              en_l_s[(i/8)-1] = en & (stat[i]|stat_pre[i-1]);
            else
              en_l_s[(i/8)-1] = en | ~(stat[i]|stat_pre[i-1]);
          end
        end

        if ( stat[fifo_sz-1] == 1'b0 )
          count_t = 32'b0;
        else if ( stat[0] == 1'b1 )
          count_t = { {(32-ph_log2){1'b0}}, fifo_sz};
        else
          count_t = n_elem[31:0];
        count = count_t;
// pragma translate_off
        if ( peak < count )
          peak = count;
// pragma translate_on
      end

      if (pwropt == 0)
      begin: NOCGFIFO
        // Output registers:
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        STATREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
        );
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_b),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        BUFREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre),
            .lz      (dummy_bufreg_lz[0]),
            .z       (buff)
        );
      end
      else
      begin: CGFIFO
        // Output registers:
        if ( pwropt > 1)
        begin: CGSTATFIFO2
          for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
          begin: pwroptGEN1
            mgc_out_reg
            #(
              .rscid   (rscid),
              .width   (1),
              .ph_clk  (ph_clk),
              .ph_en   (ph_en),
              .ph_arst (ph_arst),
              .ph_srst (ph_srst)
            )
            STATREG
            (
              .clk     (clk),
              .en      (en_l_s[eni/8]),
              .arst    (arst),
              .srst    (srst),
              .ld      (1'b1),
              .d       (stat_pre[eni]),
              .lz      (dummy_statreg_lz[eni]),
              .z       (stat[eni])
            );
          end
        end
        else
        begin: CGSTATFIFO
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          STATREG
          (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
          );
        end
        for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
        begin: pwroptGEN2
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (width),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          BUFREG
          (
            .clk     (clk),
            .en      (en_l[eni]),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre[width*eni+:width]),
            .lz      (dummy_bufreg_lz[eni]),
            .z       (buff[width*eni+:width])
          );
        end
      end
    end
    else
    begin: FEED_THRU
      assign vd = vz;
      assign lz = ld;
      assign z = d;
      assign size = ld && !vz;
    end
    endgenerate

endmodule

//------------------------------------------------------------------
//-- PIPE ENTITIES
//------------------------------------------------------------------
/*
 *
 *             _______________________________________________
 * WRITER    |                                               |          READER
 *           |           MGC_PIPE                            |
 *           |           __________________________          |
 *        --<| vdout  --<| vd ---------------  vz<|-----ldin<|---
 *           |           |      FIFO              |          |
 *        ---|>ldout  ---|>ld ---------------- lz |> ---vdin |>--
 *        ---|>dout -----|>d  ---------------- dz |> ----din |>--
 *           |           |________________________|          |
 *           |_______________________________________________|
 */
// two clock pipe
module mgc_pipe (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, size, req_size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // width of size of elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter integer log2_sz = 3; // log2(fifo_sz)
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer pwropt  = 0; // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output [sz_width-1:0]      size;
    input              req_size;


    mgc_out_fifo_wait_core
    #(
        .rscid    (rscid),
        .width    (width),
        .sz_width (sz_width),
        .fifo_sz  (fifo_sz),
        .ph_clk   (ph_clk),
        .ph_en    (ph_en),
        .ph_arst  (ph_arst),
        .ph_srst  (ph_srst),
        .ph_log2  (log2_sz),
        .pwropt   (pwropt)
    )
    FIFO
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (vdin),
        .vz      (ldin),
        .z       (din),
        .size    (size)
    );

endmodule


//------> C:/PROGRA~1/CALYPT~1/CATAPU~1.126/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_generic_reg_beh.v 
`define POS_CLK_POS_ASYNC 0
`define POS_CLK_NEG_ASYNC 1
`define NEG_CLK_POS_ASYNC 2
`define NEG_CLK_NEG_ASYNC 3
`define POS_CLK_NO_ASYNC 4
`define NEG_CLK_NO_ASYNC 5
`define N_COMBS 6

module mgc_generic_reg (d, clk, en, a_rst, s_rst, q);
   parameter width = 8;
   parameter ph_clk = 1;//clock polarity, 1=rising_edge
   parameter ph_en = 1;
   parameter ph_a_rst = 1;  // 0 to 1 IGNORED
   parameter ph_s_rst = 1;  // 0 to 1 IGNORED
   parameter a_rst_used = 1;
   parameter s_rst_used = 0;
   parameter en_used = 0;

   input  [width-1:0] d;
   input              clk;
   input              en;
   input              a_rst;
   input              s_rst;
   output [width-1:0] q;

   reg [width-1:0] q_temp [`N_COMBS-1:0];

   always@(posedge a_rst or posedge clk)
   begin
     if (a_rst)
       q_temp[`POS_CLK_POS_ASYNC] <= {width{1'b0}};
     else if (s_rst == ph_s_rst)
       q_temp[`POS_CLK_POS_ASYNC] <= {width{1'b0}};
     else begin
       if ((ph_en & en) | ((ph_en==0) & (en==0))) begin
         q_temp[`POS_CLK_POS_ASYNC] <= d;
       end
     end
   end

   always@(negedge a_rst or posedge clk)
   begin
     if (!a_rst)
       q_temp[`POS_CLK_NEG_ASYNC] <= {width{1'b0}};
     else if (s_rst == ph_s_rst)
       q_temp[`POS_CLK_NEG_ASYNC] <= {width{1'b0}};
     else begin
       if ((ph_en & en) | ((ph_en==0) & (en==0))) begin
         q_temp[`POS_CLK_NEG_ASYNC] <= d;
       end
     end
   end

   always@(posedge a_rst or negedge clk)
   begin
     if (a_rst)
       q_temp[`NEG_CLK_POS_ASYNC] <= {width{1'b0}};
     else if (s_rst == ph_s_rst)
       q_temp[`NEG_CLK_POS_ASYNC] <= {width{1'b0}};
     else begin
       if ((ph_en & en) | ((ph_en==0) & (en==0))) begin
         q_temp[`NEG_CLK_POS_ASYNC] <= d;
       end
     end
   end

   always@(negedge a_rst or negedge clk)
   begin
     if (!a_rst)
       q_temp[`NEG_CLK_NEG_ASYNC] <= {width{1'b0}};
     else if (s_rst == ph_s_rst)
       q_temp[`NEG_CLK_NEG_ASYNC] <= {width{1'b0}};
     else begin
       if ((ph_en & en) | ((ph_en==0) & (en==0))) begin
         q_temp[`NEG_CLK_NEG_ASYNC] <= d;
       end
     end
   end

   assign q = ph_clk ?
		   (ph_a_rst ?
		     q_temp[`POS_CLK_POS_ASYNC]: q_temp[`POS_CLK_NEG_ASYNC]) :
		   (ph_a_rst ?
		     q_temp[`NEG_CLK_POS_ASYNC]: q_temp[`NEG_CLK_NEG_ASYNC]);
endmodule

//------> C:/PROGRA~1/CALYPT~1/CATAPU~1.126/Mgc_home/pkgs/siflibs/ram_singleport_be_fpga.v 
////////////////////////////////////////////////////////////////////////////////
// Catapult Synthesis
//
// Copyright (c) 2003-2011 Calypto Design Systems, Inc.
//       All Rights Reserved
// 
// This document contains information that is proprietary to Calypto Design
// Systems, Inc. The original recipient of this document may duplicate this  
// document in whole or in part for internal business purposes only, provided  
// that this entire notice appears in all copies. In duplicating any part of  
// this document, the recipient agrees to make every reasonable effort to  
// prevent the unauthorized use and distribution of the proprietary information.
// 
////////////////////////////////////////////////////////////////////////////////

module singleport_ram_be ( data_in, addr, re, we, data_out, clk, a_rst, s_rst, en);

parameter ram_id          = 1;
parameter words           = 'd256;
parameter width           = 8;
parameter addr_width      = 8;
parameter [0:0] a_reset_active  = 0;
parameter [0:0] s_reset_active  = 1;
parameter [0:0] enable_active   = 1;
parameter [0:0] re_active   = 1;
parameter [0:0] we_active   = 1;
parameter num_byte_enables = 1;
parameter clock_edge = 1;
parameter num_input_registers         = 1;
parameter num_output_registers        = 0;
parameter no_of_singleport_readwrite_port  = 1;

localparam byte_width = width / num_byte_enables;

  input [(width*no_of_singleport_readwrite_port)-1:0] data_in;
  input [(addr_width*no_of_singleport_readwrite_port)-1:0] addr;
  input [(no_of_singleport_readwrite_port*num_byte_enables)-1:0] re;
  input [(no_of_singleport_readwrite_port*num_byte_enables)-1:0] we;
  output [(width*no_of_singleport_readwrite_port)-1:0] data_out;
  input clk;
  input a_rst;
  input s_rst;
  input en;

  reg  [width-1:0] mem [words-1:0];

  reg [addr_width-1        :0] addr_reg;
  reg [num_byte_enables-1:0] re_reg;

// synopsys translate_off
  integer count;
  initial
  begin
    for (count = 0; count < words; count = count + 1) 
      mem[count] = 0;
  end
// synopsys translate_on

  reg [width-1:0] data_in_inreg [((num_input_registers > 1) ? num_input_registers - 2 : 0): 0];
  reg [addr_width-1:0] addr_inreg [((num_input_registers > 1) ? num_input_registers - 2 : 0): 0];
  reg [num_byte_enables-1:0] re_inreg [((num_input_registers > 1) ? num_input_registers - 2 : 0): 0];
  reg [num_byte_enables-1:0] we_inreg [((num_input_registers > 1) ? num_input_registers - 2 : 0): 0];

  genvar i;
  generate
  begin : pipe
    if (num_input_registers > 1)
    begin
      for( i=num_input_registers-2; i >= 1; i = i - 1)
      begin : SHIFT_MSBs // Verilog 2000 syntax requires that GENERATE_LOOP_STATEMENT be a named block
                         // Modelsim seems to allow it though it should be a bug
        wire [width-1:0] data_in_i;
        wire [addr_width-1:0] addr_i;
        wire [num_byte_enables-1:0] re_i;
        wire [num_byte_enables-1:0] we_i;
  
        mgc_generic_reg #(width,      clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b0) i_data_in_inreg (data_in_inreg[i-1], clk, en, a_rst, s_rst, data_in_i);
        mgc_generic_reg #(addr_width, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b0) i_addr_inreg    (addr_inreg[i-1],    clk, en, a_rst, s_rst, addr_i);
        mgc_generic_reg #(num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b0) i_re_inreg      (re_inreg[i-1],      clk, en, a_rst, s_rst, re_i);
        mgc_generic_reg #(num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b0) i_we_inreg      (we_inreg[i-1],      clk, en, a_rst, s_rst, we_i);
  
        always@(data_in_i)
          data_in_inreg[i] = data_in_i;
  
        always@(addr_i)
          addr_inreg[i] = addr_i;
  
        always@(re_i)
          re_inreg[i] = re_i;
        always@(we_i)
          we_inreg[i] = we_i;
      end // end for loop

      // SHIFT for the first stage
      wire [width-1:0] data_in_init;
      wire [addr_width-1:0] addr_init;
      wire [num_byte_enables-1:0] re_init;
      wire [num_byte_enables-1:0] we_init;
    
      mgc_generic_reg #(width,      clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_data_in_inreg_i (data_in, clk, en, a_rst, s_rst, data_in_init);
      mgc_generic_reg #(addr_width, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_addr_inreg_i    (addr,    clk, en, a_rst, s_rst, addr_init);
      mgc_generic_reg #(num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_re_inreg_i      (re,      clk, en, a_rst, s_rst, re_init);
      mgc_generic_reg #(num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_we_inreg_i      (we,      clk, en, a_rst, s_rst, we_init);
    
      always@(data_in_init)
        data_in_inreg[0] = data_in_init;
    
      always@(addr_init)
        addr_inreg[0] = addr_init;
    
      always@(re_init)
        re_inreg[0] = re_init;

      always@(we_init)
        we_inreg[0] = we_init;
    end
  end
  endgenerate

  wire [width-1:0]      data_in_f = (num_input_registers > 1) ? data_in_inreg[num_input_registers-2] : data_in;
  wire [addr_width-1:0] addr_f    = (num_input_registers > 1) ? addr_inreg[num_input_registers-2]    : addr;
  wire [num_byte_enables-1:0]            re_f      = (num_input_registers > 1) ? re_inreg[num_input_registers-2]      : re;
  wire [num_byte_enables-1:0]            we_f      = (num_input_registers > 1) ? we_inreg[num_input_registers-2]      : we;

  reg addr_NotDontCare;
  reg addr_NotDontCare2;
  integer j, k, l, m, n, o, p, q;

  generate
    if (clock_edge == 1'b1)
      begin: POSEDGE_BLK
        always @(posedge clk)
        begin
          if ( en == enable_active )
          begin
            addr_NotDontCare = 1'b1;
            begin: blk_X
              for (j = 0; j < addr_width; j = j + 1)
              begin
                if ((addr_f[j] === 1'bX) || (addr_f[j] === 1'bZ))
                begin
                  addr_NotDontCare = 1'b0;
                  for (k = 0; k < num_byte_enables; k = k + 1)
                  begin
                    if (we_f[k] == we_active) begin
                      $display($time, " Error: Dont-care addresses for pipelined singleport memory write");
                      $finish;
                    end
                  end
                  disable blk_X;
                end
              end
            end
                                                                                        
            addr_reg <= addr_f;
            re_reg   <= re_f;

            if (addr_NotDontCare)
            begin
              if ((addr_f < words) && (addr_f >= 0)) begin
                for (j = 0; j < num_byte_enables; j = j + 1)
                begin
                  if (we_f[j] == we_active) begin
                    // mem[addr_f] <= data_in_f;
                    mem[addr_f][((j*byte_width)+byte_width)-1-:byte_width] <= data_in_f[((j*byte_width)+byte_width)-1-:byte_width];
                  end
                end
              end else begin
                for (j = 0; j < num_byte_enables; j = j + 1)
                begin
                  if (we_f[j] == we_active) begin
                    $display($time, " Error: Out-of-bound pipelined singleport memory-write");
                    $finish;
                  end
                end
              end
            end
          end
        end
      end
    else
      begin: NEGEDGE_BLK
        always @(negedge clk)
        begin
          if ( en == enable_active )
          begin
            addr_NotDontCare = 1'b1;
            begin: blk_X
              for (n = 0; n < addr_width; n = n + 1)
              begin
                if ((addr_f[n] === 1'bX) || (addr_f[n] === 1'bZ))
                begin
                  addr_NotDontCare = 1'b0;
                  for (o = 0; o < num_byte_enables; o = o + 1)
                  begin
                    if (we_f[o] == we_active) begin
                      $display($time, " Error: Dont-care addresses for pipelined singleport memory write");
                      $finish;
                    end
                  end
                  disable blk_X;
                end
              end
            end
                                                                                        
            addr_reg <= addr_f;
            re_reg   <= re_f;

            if (addr_NotDontCare)
            begin
              if ((addr_f < words) && (addr_f >= 0)) begin
                for (n = 0; n < num_byte_enables; n = n + 1)
                begin
                  if (we_f[n] == we_active) begin
                    // mem[addr_f] <= data_in_f;
                    mem[addr_f][((n*byte_width)+byte_width)-1-:byte_width] <= data_in_f[((n*byte_width)+byte_width)-1-:byte_width];
                  end
                end
              end else begin
                for (n = 0; n < num_byte_enables; n = n + 1)
                begin
                  if (we_f[n] == we_active) begin
                    $display($time, " Error: Out-of-bound pipelined singleport memory-write");
                    $finish;
                  end
                end
              end
            end
          end
        end
      end
  endgenerate

  reg [width-1:0] data_out_f;

  integer r; //TODO: added k to match vhdl
  always@(
          mem[addr_reg]
	       or addr_reg
          //TODO: commented difference// or addr_NotDontCare
	        or re_reg
          )
  begin
   //TODO: added to match VHDL :
    addr_NotDontCare2 = 1'b1;

    for(k= 0; k < addr_width-1; k = k+ 1)
    begin
      if ((addr_reg[k] === 1'bX) || (addr_reg[k] === 1'bZ)) begin
        addr_NotDontCare2 = 1'b0 ; 
      end
    end //loop

    if (addr_NotDontCare2 )
    //begin
      if ((addr_reg < words) && (addr_reg >= 0))
        for (r = 0; r < num_byte_enables; r = r + 1)
        begin
	        if ( re_reg[r] == re_active )
            data_out_f[((r*byte_width) + byte_width) - 1 -: byte_width] <= mem[addr_reg][((r*byte_width) + byte_width) - 1 -: byte_width];
          else
            data_out_f[((r*byte_width) + byte_width) - 1 -: byte_width] <= {(byte_width){1'bX}};
        end //end for loop
      else
        data_out_f <= {width{1'bX}};
    else
      data_out_f <= {width{1'bX}};
  end


  reg [width-1:0] data_out_outreg [(num_output_registers > 0 ? num_output_registers - 1 : 0): 0];

  genvar t;
  generate
  begin : outblk
    if (num_output_registers > 0)
    begin
      for( t = num_output_registers-1; t >= 1; t = t - 1)
      begin : SHIFT_MSBs // Verilog 2000 syntax requires that GENERATE_LOOP_STATEMENT be a named block
                         // Modelsim seems to allow it though it should be a bug
        wire [width-1:0] data_out_i;
        mgc_generic_reg #(width, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_data_out_outreg (data_out_outreg[t-1], clk, en, a_rst, s_rst, data_out_i);
  
        always@(data_out_i)
          data_out_outreg[t] = data_out_i;
      end // end for loop

      // SHIFT for the first stage
      wire [width-1:0] data_out_init;
      mgc_generic_reg #(width, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_data_out_outreg_i (data_out_f, clk, en, a_rst, s_rst, data_out_init);

      always@(data_out_init)
        data_out_outreg[0] = data_out_init;
    end
  end
  endgenerate

  assign data_out = (num_output_registers > 0) ? data_out_outreg[num_output_registers-1] : data_out_f;

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   al3515@EEWS104A-014
//  Generated date: Fri May 06 15:35:14 2016
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    MemBlock_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module MemBlock_core_fsm (
  clk, rst, fsm_output, st_data_vinit_1_tr0
);
  input clk;
  input rst;
  output [5:0] fsm_output;
  reg [5:0] fsm_output;
  input st_data_vinit_1_tr0;


  // FSM State Type Declaration for MemBlock_core_fsm_1
  parameter
    st_core_rlp = 3'd0,
    st_data_vinit = 3'd1,
    st_data_vinit_1 = 3'd2,
    st_main = 3'd3,
    st_main_1 = 3'd4,
    st_main_2 = 3'd5,
    state_x = 3'b000;

  reg [2:0] state_var;
  reg [2:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : MemBlock_core_fsm_1
    case (state_var)
      st_core_rlp : begin
        fsm_output = 6'b1;
        state_var_NS = st_data_vinit;
      end
      st_data_vinit : begin
        fsm_output = 6'b10;
        state_var_NS = st_data_vinit_1;
      end
      st_data_vinit_1 : begin
        fsm_output = 6'b100;
        if ( st_data_vinit_1_tr0 ) begin
          state_var_NS = st_data_vinit;
        end
        else begin
          state_var_NS = st_main;
        end
      end
      st_main : begin
        fsm_output = 6'b1000;
        state_var_NS = st_main_1;
      end
      st_main_1 : begin
        fsm_output = 6'b10000;
        state_var_NS = st_main_2;
      end
      st_main_2 : begin
        fsm_output = 6'b100000;
        state_var_NS = st_main;
      end
      default : begin
        fsm_output = 6'b000000;
        state_var_NS = st_core_rlp;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= st_core_rlp;
    end
    else begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    MemBlock_core
// ------------------------------------------------------------------


module MemBlock_core (
  clk, rst, row_rsc_mgc_in_wire_d, col_rsc_mgc_in_wire_d, bit_in_rsc_mgc_in_wire_d,
      write_enable_rsc_mgc_in_wire_d, bits_out_rsc_mgc_out_stdreg_d, data_rsc_singleport_data_in,
      data_rsc_singleport_addr, data_rsc_singleport_re, data_rsc_singleport_we, data_rsc_singleport_data_out
);
  input clk;
  input rst;
  input [5:0] row_rsc_mgc_in_wire_d;
  input [6:0] col_rsc_mgc_in_wire_d;
  input bit_in_rsc_mgc_in_wire_d;
  input write_enable_rsc_mgc_in_wire_d;
  output [29:0] bits_out_rsc_mgc_out_stdreg_d;
  reg [29:0] bits_out_rsc_mgc_out_stdreg_d;
  output data_rsc_singleport_data_in;
  output [12:0] data_rsc_singleport_addr;
  output data_rsc_singleport_re;
  output data_rsc_singleport_we;
  input data_rsc_singleport_data_out;


  // Interconnect Declarations
  wire [5:0] fsm_output;
  reg [12:0] data_vinit_ndx_sva;
  reg if_nor_itm;
  reg [12:0] if_acc_1_itm;
  wire [13:0] nl_if_acc_1_itm;
  reg io_read_write_enable_rsc_d_svs_st;
  reg data_rsc_singleport_data_in_reg;
  wire and_4_rmff;


  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_MemBlock_core_fsm_inst_st_data_vinit_1_tr0;
  assign nl_MemBlock_core_fsm_inst_st_data_vinit_1_tr0 = ~ if_nor_itm;
  MemBlock_core_fsm MemBlock_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .st_data_vinit_1_tr0(nl_MemBlock_core_fsm_inst_st_data_vinit_1_tr0)
    );
  assign and_4_rmff = bit_in_rsc_mgc_in_wire_d & (fsm_output[3]);
  assign data_rsc_singleport_data_in = and_4_rmff;
  assign data_rsc_singleport_addr = MUX_v_13_2_2({data_vinit_ndx_sva , ({1'b0 , (conv_s2u_7_10(({2'b10
      , (col_rsc_mgc_in_wire_d[6:2])}) + conv_u2s_6_7(~ row_rsc_mgc_in_wire_d)) +
      ({row_rsc_mgc_in_wire_d , 4'b1})) , (col_rsc_mgc_in_wire_d[1:0])})}, fsm_output[3]);
  assign data_rsc_singleport_re = ~((fsm_output[3]) & (~ write_enable_rsc_mgc_in_wire_d));
  assign data_rsc_singleport_we = ~(((fsm_output[3]) & write_enable_rsc_mgc_in_wire_d)
      | (fsm_output[1]));
  always @(posedge clk) begin
    if ( rst ) begin
      data_rsc_singleport_data_in_reg <= 1'b0;
      bits_out_rsc_mgc_out_stdreg_d <= 30'b0;
      data_vinit_ndx_sva <= 13'b1001010111111;
      if_nor_itm <= 1'b0;
      if_acc_1_itm <= 13'b0;
      io_read_write_enable_rsc_d_svs_st <= 1'b0;
    end
    else begin
      data_rsc_singleport_data_in_reg <= and_4_rmff;
      bits_out_rsc_mgc_out_stdreg_d <= MUX_v_30_2_2({bits_out_rsc_mgc_out_stdreg_d
          , ({9'b0 , (MUX_s_1_2_2({data_rsc_singleport_data_out , data_rsc_singleport_data_in_reg},
          io_read_write_enable_rsc_d_svs_st)) , 20'b0})}, fsm_output[4]);
      data_vinit_ndx_sva <= MUX_v_13_2_2({data_vinit_ndx_sva , if_acc_1_itm}, fsm_output[2]);
      if_nor_itm <= ~((data_vinit_ndx_sva[12]) | (data_vinit_ndx_sva[11]) | (data_vinit_ndx_sva[10])
          | (data_vinit_ndx_sva[9]) | (data_vinit_ndx_sva[8]) | (data_vinit_ndx_sva[7])
          | (data_vinit_ndx_sva[6]) | (data_vinit_ndx_sva[5]) | (data_vinit_ndx_sva[4])
          | (data_vinit_ndx_sva[3]) | (data_vinit_ndx_sva[2]) | (data_vinit_ndx_sva[1])
          | (data_vinit_ndx_sva[0]));
      if_acc_1_itm <= nl_if_acc_1_itm[12:0];
      io_read_write_enable_rsc_d_svs_st <= write_enable_rsc_mgc_in_wire_d;
    end
  end
  assign nl_if_acc_1_itm  = data_vinit_ndx_sva + 13'b1111111111111;

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


  function  [9:0] conv_s2u_7_10 ;
    input signed [6:0]  vector ;
  begin
    conv_s2u_7_10 = {{3{vector[6]}}, vector};
  end
  endfunction


  function signed [6:0] conv_u2s_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2s_6_7 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    MemBlock
//  Generated from file(s):
//    2) $PROJECT_HOME/src2/NewMemory.cpp
//    6) $MGC_HOME/shared/include/ac_int.h
// ------------------------------------------------------------------


module MemBlock (
  row_rsc_z, col_rsc_z, bit_in_rsc_z, write_enable_rsc_z, bits_out_rsc_z, clk, rst
);
  input [5:0] row_rsc_z;
  input [6:0] col_rsc_z;
  input bit_in_rsc_z;
  input write_enable_rsc_z;
  output [29:0] bits_out_rsc_z;
  input clk;
  input rst;


  // Interconnect Declarations
  wire [5:0] row_rsc_mgc_in_wire_d;
  wire [6:0] col_rsc_mgc_in_wire_d;
  wire bit_in_rsc_mgc_in_wire_d;
  wire write_enable_rsc_mgc_in_wire_d;
  wire [29:0] bits_out_rsc_mgc_out_stdreg_d;
  wire data_rsc_singleport_data_in;
  wire [12:0] data_rsc_singleport_addr;
  wire data_rsc_singleport_re;
  wire data_rsc_singleport_we;
  wire data_rsc_singleport_data_out;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(6)) row_rsc_mgc_in_wire (
      .d(row_rsc_mgc_in_wire_d),
      .z(row_rsc_z)
    );
  mgc_in_wire #(.rscid(2),
  .width(7)) col_rsc_mgc_in_wire (
      .d(col_rsc_mgc_in_wire_d),
      .z(col_rsc_z)
    );
  mgc_in_wire #(.rscid(3),
  .width(1)) bit_in_rsc_mgc_in_wire (
      .d(bit_in_rsc_mgc_in_wire_d),
      .z(bit_in_rsc_z)
    );
  mgc_in_wire #(.rscid(4),
  .width(1)) write_enable_rsc_mgc_in_wire (
      .d(write_enable_rsc_mgc_in_wire_d),
      .z(write_enable_rsc_z)
    );
  mgc_out_stdreg #(.rscid(5),
  .width(30)) bits_out_rsc_mgc_out_stdreg (
      .d(bits_out_rsc_mgc_out_stdreg_d),
      .z(bits_out_rsc_z)
    );
  singleport_ram_be #(.ram_id(6),
  .words(4800),
  .width(1),
  .addr_width(13),
  .a_reset_active(0),
  .s_reset_active(1),
  .enable_active(0),
  .re_active(0),
  .we_active(0),
  .num_byte_enables(1),
  .clock_edge(1),
  .num_input_registers(1),
  .num_output_registers(0),
  .no_of_singleport_readwrite_port(1)) data_rsc_singleport (
      .data_in(data_rsc_singleport_data_in),
      .addr(data_rsc_singleport_addr),
      .re(data_rsc_singleport_re),
      .we(data_rsc_singleport_we),
      .data_out(data_rsc_singleport_data_out),
      .clk(clk),
      .a_rst(1'b1),
      .s_rst(rst),
      .en(1'b0)
    );
  MemBlock_core MemBlock_core_inst (
      .clk(clk),
      .rst(rst),
      .row_rsc_mgc_in_wire_d(row_rsc_mgc_in_wire_d),
      .col_rsc_mgc_in_wire_d(col_rsc_mgc_in_wire_d),
      .bit_in_rsc_mgc_in_wire_d(bit_in_rsc_mgc_in_wire_d),
      .write_enable_rsc_mgc_in_wire_d(write_enable_rsc_mgc_in_wire_d),
      .bits_out_rsc_mgc_out_stdreg_d(bits_out_rsc_mgc_out_stdreg_d),
      .data_rsc_singleport_data_in(data_rsc_singleport_data_in),
      .data_rsc_singleport_addr(data_rsc_singleport_addr),
      .data_rsc_singleport_re(data_rsc_singleport_re),
      .data_rsc_singleport_we(data_rsc_singleport_we),
      .data_rsc_singleport_data_out(data_rsc_singleport_data_out)
    );
endmodule



