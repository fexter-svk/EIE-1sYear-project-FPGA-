
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


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   mf2915@EEWS305-026
//  Generated date: Sat May 07 15:52:30 2016
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
  wire or_dcpl_7;
  wire not_tmp_8;
  reg [89:0] regs_regs_1_sva;
  reg [3:0] acc_15_0_sva;
  reg [3:0] acc_15_1_sva;
  reg [9:0] red_xy_0_sva;
  reg [9:0] red_xy_1_sva;
  reg [9:0] blue_xy_0_sva;
  reg [9:0] blue_xy_1_sva;
  reg if_9_land_lpi_1_dfm;
  reg [9:0] MAC1_acc_psp_sg1_sva_1;
  reg [9:0] MAC1_acc_39_psp_sg1_sva_1;
  reg [9:0] MAC1_acc_40_psp_sg1_sva_1;
  reg land_12_lpi_1_dfm_1;
  reg land_14_lpi_1_dfm_1;
  reg lor_4_lpi_1_dfm_1;
  reg [9:0] deltay_square_red_slc_deltay_square_red_acc_psp_itm_1;
  reg aif_41_slc_itm_1;
  reg [2:0] volume_current_slc_acc_idiv_8_itm_1;
  reg volume_current_slc_acc_idiv_6_itm_1;
  reg volume_current_slc_acc_idiv_20_itm_1;
  reg volume_current_slc_acc_idiv_21_itm_1;
  reg volume_current_slc_acc_idiv_22_itm_1;
  reg volume_current_slc_acc_idiv_13_itm_1;
  reg [3:0] volume_current_slc_acc_idiv_7_itm_1;
  reg main_stage_0_2;
  wire if_9_land_lpi_1_dfm_mx0;
  wire [3:0] acc_15_0_sva_dfm_1_mx0;
  wire [9:0] blue_xy_1_sva_dfm;
  wire [9:0] blue_xy_0_sva_dfm;
  wire [9:0] red_xy_1_sva_dfm;
  wire [9:0] red_xy_0_sva_dfm;
  reg reg_deltay_square_blue_acc_psp_sva_tmp;
  wire [11:0] deltay_square_blue_acc_1_itm;
  wire [12:0] nl_deltay_square_blue_acc_1_itm;
  wire [12:0] MAC1_acc_itm;
  wire [13:0] nl_MAC1_acc_itm;
  wire [12:0] MAC1_acc_78_itm;
  wire [13:0] nl_MAC1_acc_78_itm;
  wire [12:0] MAC1_acc_79_itm;
  wire [13:0] nl_MAC1_acc_79_itm;
  wire [11:0] deltay_square_red_acc_1_itm;
  wire [12:0] nl_deltay_square_red_acc_1_itm;
  wire [10:0] aif_39_acc_itm;
  wire [11:0] nl_aif_39_acc_itm;
  wire [11:0] deltax_square_red_acc_1_itm;
  wire [12:0] nl_deltax_square_red_acc_1_itm;
  wire [11:0] deltax_square_blue_acc_1_itm;
  wire [12:0] nl_deltax_square_blue_acc_1_itm;
  wire [4:0] acc_3_itm;
  wire [5:0] nl_acc_3_itm;
  wire [89:0] regs_regs_0_sva_mx0;
  wire land_11_lpi_1_dfm;
  wire land_13_lpi_1_dfm;
  wire lor_3_lpi_1_dfm;
  wire [4:0] volume_current_acc_psp_sva;
  wire [5:0] nl_volume_current_acc_psp_sva;
  wire [3:0] volume_current_acc_2_psp_sva;
  wire [4:0] nl_volume_current_acc_2_psp_sva;
  wire [3:0] acc_15_0_sva_dfm;
  wire [3:0] acc_15_1_sva_dfm_1_mx0;
  wire [3:0] acc_15_1_sva_dfm;
  wire [9:0] red_xy_1_sva_dfm_2_mx0;
  wire [9:0] red_xy_0_sva_dfm_2_mx0;
  wire equal_1_cse_sva;
  wire [9:0] blue_xy_0_sva_dfm_2_mx0;
  wire [9:0] blue_xy_1_sva_mx0;
  wire [3:0] if_3_acc_svs;
  wire [4:0] nl_if_3_acc_svs;
  wire [3:0] if_3_acc_1_psp_sva;
  wire [4:0] nl_if_3_acc_1_psp_sva;
  wire [5:0] acc_imod_2_sva;
  wire [6:0] nl_acc_imod_2_sva;
  wire [10:0] volume_current_acc_8_psp;
  wire [11:0] nl_volume_current_acc_8_psp;
  wire [10:0] volume_current_acc_3_sdt;
  wire [11:0] nl_volume_current_acc_3_sdt;
  wire [11:0] MAC1_acc_45_itm;
  wire [12:0] nl_MAC1_acc_45_itm;
  wire [11:0] MAC1_acc_52_itm;
  wire [12:0] nl_MAC1_acc_52_itm;
  wire [11:0] MAC1_acc_59_itm;
  wire [12:0] nl_MAC1_acc_59_itm;
  wire nand_1_itm;
  wire or_itm;


  // Interconnect Declarations for Component Instantiations 
  assign regs_regs_0_sva_mx0 = vin & ({{89{main_stage_0_2}}, main_stage_0_2});
  assign nl_deltay_square_blue_acc_1_itm = ({1'b1 , (vga_xy[19:10]) , 1'b1}) + conv_u2s_11_12({(~
      blue_xy_1_sva) , 1'b1});
  assign deltay_square_blue_acc_1_itm = nl_deltay_square_blue_acc_1_itm[11:0];
  assign nl_MAC1_acc_45_itm = conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[29:20])
      + conv_u2u_10_11(regs_regs_1_sva[89:80])) + conv_u2u_11_12(conv_u2u_10_11(vin[29:20])
      + conv_u2u_10_11(vin[89:80]));
  assign MAC1_acc_45_itm = nl_MAC1_acc_45_itm[11:0];
  assign nl_MAC1_acc_itm = conv_u2u_12_13(conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[59:50])
      + conv_u2u_10_11(regs_regs_0_sva_mx0[29:20])) + conv_u2u_11_12(conv_u2u_10_11(regs_regs_0_sva_mx0[89:80])
      + conv_u2u_10_11(vin[59:50]))) + conv_u2u_12_13({(conv_u2u_10_11(MAC1_acc_45_itm[11:2])
      + conv_u2u_10_11(regs_regs_0_sva_mx0[59:50])) , (MAC1_acc_45_itm[1])});
  assign MAC1_acc_itm = nl_MAC1_acc_itm[12:0];
  assign land_11_lpi_1_dfm = (~ (readslicef_11_1_10((({1'b1 , (~ deltay_square_red_slc_deltay_square_red_acc_psp_itm_1)})
      + 11'b101001)))) & (~ aif_41_slc_itm_1) & land_12_lpi_1_dfm_1;
  assign land_13_lpi_1_dfm = (~ (readslicef_11_1_10((({1'b1 , (~ (deltay_square_blue_acc_1_itm[10:1]))})
      + 11'b101001)))) & (~ (deltay_square_blue_acc_1_itm[11])) & land_14_lpi_1_dfm_1;
  assign lor_3_lpi_1_dfm = ((vga_xy[18]) & (vga_xy[17]) & (vga_xy[16]) & (vga_xy[15])
      & (~((vga_xy[19]) | (vga_xy[14]) | (vga_xy[13]) | (vga_xy[12]) | (vga_xy[11])
      | (vga_xy[10])))) | lor_4_lpi_1_dfm_1;
  assign nl_MAC1_acc_52_itm = conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[19:10])
      + conv_u2u_10_11(regs_regs_1_sva[79:70])) + conv_u2u_11_12(conv_u2u_10_11(vin[19:10])
      + conv_u2u_10_11(vin[79:70]));
  assign MAC1_acc_52_itm = nl_MAC1_acc_52_itm[11:0];
  assign nl_MAC1_acc_78_itm = conv_u2u_12_13(conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[49:40])
      + conv_u2u_10_11(regs_regs_0_sva_mx0[19:10])) + conv_u2u_11_12(conv_u2u_10_11(regs_regs_0_sva_mx0[79:70])
      + conv_u2u_10_11(vin[49:40]))) + conv_u2u_12_13({(conv_u2u_10_11(MAC1_acc_52_itm[11:2])
      + conv_u2u_10_11(regs_regs_0_sva_mx0[49:40])) , (MAC1_acc_52_itm[1])});
  assign MAC1_acc_78_itm = nl_MAC1_acc_78_itm[12:0];
  assign nl_MAC1_acc_59_itm = conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[9:0])
      + conv_u2u_10_11(regs_regs_1_sva[69:60])) + conv_u2u_11_12(conv_u2u_10_11(vin[9:0])
      + conv_u2u_10_11(vin[69:60]));
  assign MAC1_acc_59_itm = nl_MAC1_acc_59_itm[11:0];
  assign nl_MAC1_acc_79_itm = conv_u2u_12_13(conv_u2u_11_12(conv_u2u_10_11(regs_regs_1_sva[39:30])
      + conv_u2u_10_11(regs_regs_0_sva_mx0[9:0])) + conv_u2u_11_12(conv_u2u_10_11(regs_regs_0_sva_mx0[69:60])
      + conv_u2u_10_11(vin[39:30]))) + conv_u2u_12_13({(conv_u2u_10_11(MAC1_acc_59_itm[11:2])
      + conv_u2u_10_11(regs_regs_0_sva_mx0[39:30])) , (MAC1_acc_59_itm[1])});
  assign MAC1_acc_79_itm = nl_MAC1_acc_79_itm[12:0];
  assign nl_volume_current_acc_psp_sva = (readslicef_6_5_1((conv_s2s_5_6({volume_current_slc_acc_idiv_7_itm_1
      , 1'b1}) + conv_u2s_5_6({(~ volume_current_slc_acc_idiv_6_itm_1) , 3'b0 , volume_current_slc_acc_idiv_6_itm_1}))))
      + conv_s2u_4_5({1'b1 , volume_current_slc_acc_idiv_8_itm_1});
  assign volume_current_acc_psp_sva = nl_volume_current_acc_psp_sva[4:0];
  assign nl_volume_current_acc_2_psp_sva = conv_s2u_2_4(conv_s2s_1_2(volume_current_acc_psp_sva[4])
      + conv_u2s_1_2(volume_current_acc_psp_sva[3])) + (volume_current_acc_psp_sva[3:0]);
  assign volume_current_acc_2_psp_sva = nl_volume_current_acc_2_psp_sva[3:0];
  assign acc_15_0_sva_dfm_1_mx0 = MUX_v_4_2_2({(acc_15_0_sva_dfm + 4'b1) , acc_15_0_sva_dfm},
      (readslicef_4_1_3((conv_u2u_3_4(MAC1_acc_itm[12:10]) + 4'b1011))) | (readslicef_10_1_9((conv_u2s_9_10(~
      (MAC1_acc_itm[11:3])) + 10'b1111111101))) | (readslicef_11_1_10((({1'b1 , (~
      (MAC1_acc_78_itm[12:3]))}) + 11'b110010001))));
  assign acc_15_0_sva_dfm = acc_15_0_sva & ({{3{or_itm}}, or_itm});
  assign acc_15_1_sva_dfm_1_mx0 = MUX_v_4_2_2({(acc_15_1_sva_dfm + 4'b1) , acc_15_1_sva_dfm},
      (readslicef_11_1_10((({1'b1 , (~ (MAC1_acc_itm[12:3]))}) + 11'b101000001)))
      | (readslicef_11_1_10((({1'b1 , (~ (MAC1_acc_78_itm[12:3]))}) + 11'b101000001)))
      | (readslicef_8_1_7((conv_u2u_7_8(MAC1_acc_79_itm[12:6]) + 8'b11010011))) |
      (readslicef_10_1_9(((~ (MAC1_acc_79_itm[12:3])) + 10'b1011010001))));
  assign acc_15_1_sva_dfm = acc_15_1_sva & ({{3{or_itm}}, or_itm});
  assign red_xy_1_sva_dfm_2_mx0 = MUX_v_10_2_2({(vga_xy[19:10]) , red_xy_1_sva_dfm},
      or_dcpl_7);
  assign red_xy_0_sva_dfm_2_mx0 = MUX_v_10_2_2({(vga_xy[9:0]) , red_xy_0_sva_dfm},
      or_dcpl_7);
  assign red_xy_1_sva_dfm = red_xy_1_sva & ({{9{nand_1_itm}}, nand_1_itm});
  assign red_xy_0_sva_dfm = red_xy_0_sva & ({{9{nand_1_itm}}, nand_1_itm});
  assign if_9_land_lpi_1_dfm_mx0 = MUX_s_1_2_2({if_9_land_lpi_1_dfm , (~((blue_xy_1_sva_dfm[9])
      | (blue_xy_1_sva_dfm[8]) | (blue_xy_1_sva_dfm[7]) | (blue_xy_1_sva_dfm[6])
      | (blue_xy_1_sva_dfm[5]) | (blue_xy_1_sva_dfm[4]) | (blue_xy_1_sva_dfm[3])
      | (blue_xy_1_sva_dfm[2]) | (blue_xy_1_sva_dfm[1]) | (blue_xy_1_sva_dfm[0])
      | (blue_xy_0_sva_dfm[9]) | (blue_xy_0_sva_dfm[8]) | (blue_xy_0_sva_dfm[7])
      | (blue_xy_0_sva_dfm[6]) | (blue_xy_0_sva_dfm[5]) | (blue_xy_0_sva_dfm[4])
      | (blue_xy_0_sva_dfm[3]) | (blue_xy_0_sva_dfm[2]) | (blue_xy_0_sva_dfm[1])
      | (blue_xy_0_sva_dfm[0])))}, acc_3_itm[4]);
  assign blue_xy_1_sva_dfm = blue_xy_1_sva & ({{9{nand_1_itm}}, nand_1_itm});
  assign blue_xy_0_sva_dfm = blue_xy_0_sva & ({{9{nand_1_itm}}, nand_1_itm});
  assign nl_deltay_square_red_acc_1_itm = ({1'b1 , (vga_xy[19:10]) , 1'b1}) + conv_u2s_11_12({(~
      red_xy_1_sva_dfm_2_mx0) , 1'b1});
  assign deltay_square_red_acc_1_itm = nl_deltay_square_red_acc_1_itm[11:0];
  assign nl_aif_39_acc_itm = ({1'b1 , (~ (deltax_square_red_acc_1_itm[10:1]))}) +
      11'b101001;
  assign aif_39_acc_itm = nl_aif_39_acc_itm[10:0];
  assign nl_deltax_square_red_acc_1_itm = ({1'b1 , (vga_xy[9:0]) , 1'b1}) + conv_u2s_11_12({(~
      red_xy_0_sva_dfm_2_mx0) , 1'b1});
  assign deltax_square_red_acc_1_itm = nl_deltax_square_red_acc_1_itm[11:0];
  assign equal_1_cse_sva = ~((vga_xy[19]) | (vga_xy[18]) | (vga_xy[17]) | (vga_xy[16])
      | (vga_xy[15]) | (vga_xy[14]) | (vga_xy[13]) | (vga_xy[12]) | (vga_xy[11])
      | (vga_xy[10]));
  assign nl_deltax_square_blue_acc_1_itm = ({1'b1 , (vga_xy[9:0]) , 1'b1}) + conv_u2s_11_12({(~
      blue_xy_0_sva_dfm_2_mx0) , 1'b1});
  assign deltax_square_blue_acc_1_itm = nl_deltax_square_blue_acc_1_itm[11:0];
  assign blue_xy_0_sva_dfm_2_mx0 = MUX_v_10_2_2({(vga_xy[9:0]) , blue_xy_0_sva_dfm},
      not_tmp_8);
  assign nl_acc_3_itm = ({1'b1 , (~ acc_15_1_sva_dfm_1_mx0)}) + 5'b101;
  assign acc_3_itm = nl_acc_3_itm[4:0];
  assign blue_xy_1_sva_mx0 = MUX_v_10_2_2({(vga_xy[19:10]) , blue_xy_1_sva_dfm},
      not_tmp_8);
  assign nl_if_3_acc_svs = conv_s2u_1_4(if_3_acc_1_psp_sva[3]) + if_3_acc_1_psp_sva;
  assign if_3_acc_svs = nl_if_3_acc_svs[3:0];
  assign nl_if_3_acc_1_psp_sva = (readslicef_5_4_1((({(~ (acc_imod_2_sva[3])) , 4'b1})
      + conv_s2u_3_5(acc_imod_2_sva[5:3])))) + ({1'b1 , (acc_imod_2_sva[2:0])});
  assign if_3_acc_1_psp_sva = nl_if_3_acc_1_psp_sva[3:0];
  assign nl_acc_imod_2_sva = conv_s2s_5_6(({3'b100 , (vga_xy[9:8])}) + conv_u2s_4_5(readslicef_5_4_1((conv_u2u_4_5({(vga_xy[2:0])
      , 1'b1}) + conv_u2u_4_5(vga_xy[6:3]))))) + conv_u2s_5_6({(conv_u2u_1_2(~ (vga_xy[3]))
      + conv_u2u_1_2(~ (vga_xy[7]))) , 2'b0 , (readslicef_2_1_1((conv_u2u_1_2(vga_xy[7])
      + 2'b1)))});
  assign acc_imod_2_sva = nl_acc_imod_2_sva[5:0];
  assign nl_volume_current_acc_8_psp = conv_u2u_10_11(volume_current_acc_3_sdt[10:1])
      + 11'b10111100001;
  assign volume_current_acc_8_psp = nl_volume_current_acc_8_psp[10:0];
  assign nl_volume_current_acc_3_sdt = conv_u2u_10_11(~ red_xy_1_sva_dfm_2_mx0) +
      conv_u2u_10_11(~ blue_xy_1_sva_mx0);
  assign volume_current_acc_3_sdt = nl_volume_current_acc_3_sdt[10:0];
  assign nand_1_itm = ~((~((vga_xy[9]) | (vga_xy[8]) | (vga_xy[7]) | (vga_xy[6])
      | (vga_xy[5]) | (vga_xy[4]) | (vga_xy[3]) | (vga_xy[2]) | (vga_xy[1]) | (vga_xy[0])))
      & equal_1_cse_sva);
  assign or_itm = (if_3_acc_svs[3]) | (if_3_acc_svs[2]) | (if_3_acc_svs[1]) | (if_3_acc_svs[0]);
  assign or_dcpl_7 = (~ (readslicef_5_1_4((({1'b1 , (~ acc_15_0_sva_dfm_1_mx0)})
      + 5'b101)))) | (red_xy_1_sva_dfm[9]) | (red_xy_1_sva_dfm[8]) | (red_xy_1_sva_dfm[7])
      | (red_xy_1_sva_dfm[6]) | (red_xy_1_sva_dfm[5]) | (red_xy_1_sva_dfm[4]) | (red_xy_1_sva_dfm[3])
      | (red_xy_1_sva_dfm[2]) | (red_xy_1_sva_dfm[1]) | (red_xy_1_sva_dfm[0]) | (red_xy_0_sva_dfm[9])
      | (red_xy_0_sva_dfm[8]) | (red_xy_0_sva_dfm[7]) | (red_xy_0_sva_dfm[6]) | (red_xy_0_sva_dfm[5])
      | (red_xy_0_sva_dfm[4]) | (red_xy_0_sva_dfm[3]) | (red_xy_0_sva_dfm[2]) | (red_xy_0_sva_dfm[1])
      | (red_xy_0_sva_dfm[0]);
  assign not_tmp_8 = ~(if_9_land_lpi_1_dfm_mx0 & (acc_3_itm[4]));
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      vout_rsc_mgc_out_stdreg_d <= 30'b0;
      volume_rsc_mgc_out_stdreg_d <= 4'b0;
      deltay_square_red_slc_deltay_square_red_acc_psp_itm_1 <= 10'b0;
      MAC1_acc_psp_sg1_sva_1 <= 10'b0;
      MAC1_acc_39_psp_sg1_sva_1 <= 10'b0;
      MAC1_acc_40_psp_sg1_sva_1 <= 10'b0;
      lor_4_lpi_1_dfm_1 <= 1'b0;
      volume_current_slc_acc_idiv_6_itm_1 <= 1'b0;
      volume_current_slc_acc_idiv_20_itm_1 <= 1'b0;
      volume_current_slc_acc_idiv_21_itm_1 <= 1'b0;
      volume_current_slc_acc_idiv_22_itm_1 <= 1'b0;
      volume_current_slc_acc_idiv_13_itm_1 <= 1'b0;
      volume_current_slc_acc_idiv_7_itm_1 <= 4'b0;
      volume_current_slc_acc_idiv_8_itm_1 <= 3'b0;
      land_14_lpi_1_dfm_1 <= 1'b0;
      aif_41_slc_itm_1 <= 1'b0;
      land_12_lpi_1_dfm_1 <= 1'b0;
      if_9_land_lpi_1_dfm <= 1'b0;
      blue_xy_1_sva <= 10'b0;
      blue_xy_0_sva <= 10'b0;
      red_xy_1_sva <= 10'b0;
      red_xy_0_sva <= 10'b0;
      acc_15_1_sva <= 4'b0;
      acc_15_0_sva <= 4'b0;
      regs_regs_1_sva <= 90'b0;
      main_stage_0_2 <= 1'b0;
      reg_deltay_square_blue_acc_psp_sva_tmp <= 1'b0;
    end
    else begin
      if ( en ) begin
        vout_rsc_mgc_out_stdreg_d <= MUX_v_30_2_2({vout_rsc_mgc_out_stdreg_d , ({(~((~(MAC1_acc_psp_sg1_sva_1
            | ({{9{land_11_lpi_1_dfm}}, land_11_lpi_1_dfm}))) | ({{9{land_13_lpi_1_dfm}},
            land_13_lpi_1_dfm}) | ({{9{lor_3_lpi_1_dfm}}, lor_3_lpi_1_dfm}))) , (MAC1_acc_39_psp_sg1_sva_1
            & (signext_10_1(~ land_11_lpi_1_dfm)) & (signext_10_1(~ land_13_lpi_1_dfm))
            & (signext_10_1(~ lor_3_lpi_1_dfm))) , (~((~((MAC1_acc_40_psp_sg1_sva_1
            & (signext_10_1(~ land_11_lpi_1_dfm))) | ({{9{land_13_lpi_1_dfm}}, land_13_lpi_1_dfm})))
            | ({{9{lor_3_lpi_1_dfm}}, lor_3_lpi_1_dfm})))})}, main_stage_0_2);
        volume_rsc_mgc_out_stdreg_d <= MUX_v_4_2_2({volume_rsc_mgc_out_stdreg_d ,
            (conv_s2u_3_4(readslicef_4_3_1((conv_u2s_3_4({(readslicef_3_2_1((conv_u2u_2_3({(volume_current_acc_psp_sva[3])
            , 1'b1}) + conv_u2u_2_3({(~ (volume_current_acc_psp_sva[4])) , (~((volume_current_acc_2_psp_sva[3])
            & (~ (volume_current_slc_acc_idiv_7_itm_1[3]))))})))) , 1'b1}) + conv_s2s_3_4({1'b1
            , volume_current_slc_acc_idiv_6_itm_1 , ((volume_current_slc_acc_idiv_7_itm_1[3])
            & (~ (volume_current_acc_2_psp_sva[3])) & ((volume_current_acc_2_psp_sva[2])
            | (volume_current_acc_2_psp_sva[1]) | (volume_current_acc_2_psp_sva[0])
            | volume_current_slc_acc_idiv_20_itm_1 | volume_current_slc_acc_idiv_21_itm_1
            | volume_current_slc_acc_idiv_22_itm_1 | volume_current_slc_acc_idiv_13_itm_1))}))))
            + volume_current_slc_acc_idiv_7_itm_1)}, main_stage_0_2);
        deltay_square_red_slc_deltay_square_red_acc_psp_itm_1 <= deltay_square_red_acc_1_itm[10:1];
        MAC1_acc_psp_sg1_sva_1 <= MAC1_acc_itm[12:3];
        MAC1_acc_39_psp_sg1_sva_1 <= MAC1_acc_78_itm[12:3];
        MAC1_acc_40_psp_sg1_sva_1 <= MAC1_acc_79_itm[12:3];
        lor_4_lpi_1_dfm_1 <= ((vga_xy[18]) & (vga_xy[16]) & (vga_xy[15]) & (vga_xy[13])
            & (~((vga_xy[19]) | (vga_xy[17]) | (vga_xy[14]) | (vga_xy[12]) | (vga_xy[11])
            | (vga_xy[10])))) | ((vga_xy[17]) & (vga_xy[16]) & (vga_xy[15]) & (vga_xy[14])
            & (~((vga_xy[19]) | (vga_xy[18]) | (vga_xy[13]) | (vga_xy[12]) | (vga_xy[11])
            | (vga_xy[10])))) | ((vga_xy[16]) & (vga_xy[15]) & (vga_xy[14]) & (vga_xy[13])
            & (~((vga_xy[19]) | (vga_xy[18]) | (vga_xy[17]) | (vga_xy[12]) | (vga_xy[11])
            | (vga_xy[10])))) | equal_1_cse_sva;
        volume_current_slc_acc_idiv_6_itm_1 <= volume_current_acc_8_psp[6];
        volume_current_slc_acc_idiv_20_itm_1 <= volume_current_acc_8_psp[2];
        volume_current_slc_acc_idiv_21_itm_1 <= volume_current_acc_8_psp[1];
        volume_current_slc_acc_idiv_22_itm_1 <= volume_current_acc_8_psp[0];
        volume_current_slc_acc_idiv_13_itm_1 <= volume_current_acc_3_sdt[0];
        volume_current_slc_acc_idiv_7_itm_1 <= volume_current_acc_8_psp[10:7];
        volume_current_slc_acc_idiv_8_itm_1 <= volume_current_acc_8_psp[5:3];
        land_14_lpi_1_dfm_1 <= ~((readslicef_11_1_10((({1'b1 , (~ (deltax_square_blue_acc_1_itm[10:1]))})
            + 11'b101001))) | (deltax_square_blue_acc_1_itm[11]));
        aif_41_slc_itm_1 <= MUX_s_1_2_2({(deltay_square_red_acc_1_itm[11]) , aif_41_slc_itm_1},
            (deltax_square_red_acc_1_itm[11]) | (aif_39_acc_itm[10]));
        land_12_lpi_1_dfm_1 <= ~((aif_39_acc_itm[10]) | (deltax_square_red_acc_1_itm[11]));
        if_9_land_lpi_1_dfm <= if_9_land_lpi_1_dfm_mx0;
        blue_xy_1_sva <= blue_xy_1_sva_mx0;
        blue_xy_0_sva <= blue_xy_0_sva_dfm_2_mx0;
        red_xy_1_sva <= red_xy_1_sva_dfm_2_mx0;
        red_xy_0_sva <= red_xy_0_sva_dfm_2_mx0;
        acc_15_1_sva <= acc_15_1_sva_dfm_1_mx0;
        acc_15_0_sva <= acc_15_0_sva_dfm_1_mx0;
        regs_regs_1_sva <= regs_regs_0_sva_mx0;
        main_stage_0_2 <= 1'b1;
        reg_deltay_square_blue_acc_psp_sva_tmp <= MUX_s_1_2_2({reg_deltay_square_blue_acc_psp_sva_tmp
            , (MUX_s_1_2_2({reg_deltay_square_blue_acc_psp_sva_tmp , (deltay_square_blue_acc_1_itm[11])},
            land_14_lpi_1_dfm_1))}, main_stage_0_2);
      end
    end
  end

  function [0:0] readslicef_11_1_10;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 10;
    readslicef_11_1_10 = tmp[0:0];
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


  function [0:0] readslicef_4_1_3;
    input [3:0] vector;
    reg [3:0] tmp;
  begin
    tmp = vector >> 3;
    readslicef_4_1_3 = tmp[0:0];
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


  function [0:0] readslicef_8_1_7;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_8_1_7 = tmp[0:0];
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


  function [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
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


  function [9:0] signext_10_1;
    input [0:0] vector;
  begin
    signext_10_1= {{9{vector[0]}}, vector};
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


  function signed [11:0] conv_u2s_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2s_11_12 = {1'b0, vector};
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


  function  [12:0] conv_u2u_12_13 ;
    input [11:0]  vector ;
  begin
    conv_u2u_12_13 = {1'b0, vector};
  end
  endfunction


  function signed [5:0] conv_s2s_5_6 ;
    input signed [4:0]  vector ;
  begin
    conv_s2s_5_6 = {vector[4], vector};
  end
  endfunction


  function signed [5:0] conv_u2s_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2s_5_6 = {1'b0, vector};
  end
  endfunction


  function  [4:0] conv_s2u_4_5 ;
    input signed [3:0]  vector ;
  begin
    conv_s2u_4_5 = {vector[3], vector};
  end
  endfunction


  function  [3:0] conv_s2u_2_4 ;
    input signed [1:0]  vector ;
  begin
    conv_s2u_2_4 = {{2{vector[1]}}, vector};
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


  function  [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction


  function signed [9:0] conv_u2s_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2s_9_10 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function  [3:0] conv_s2u_1_4 ;
    input signed [0:0]  vector ;
  begin
    conv_s2u_1_4 = {{3{vector[0]}}, vector};
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


  function  [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
  end
  endfunction


  function  [1:0] conv_u2u_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_2 = {1'b0, vector};
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



