
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
//  Generated by:   gsp14@EEWS104A-011
//  Generated date: Mon Apr 25 15:10:44 2016
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    mean_vga_core
// ------------------------------------------------------------------


module mean_vga_core (
  clk, en, arst_n, vin_rsc_mgc_in_wire_d, vout_rsc_mgc_out_stdreg_d, counter_rsc_mgc_out_stdreg_d
);
  input clk;
  input en;
  input arst_n;
  input [89:0] vin_rsc_mgc_in_wire_d;
  output [29:0] vout_rsc_mgc_out_stdreg_d;
  reg [29:0] vout_rsc_mgc_out_stdreg_d;
  output [15:0] counter_rsc_mgc_out_stdreg_d;
  reg [15:0] counter_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations
  wire [12:0] MAC3_acc_86_tmp;
  wire [13:0] nl_MAC3_acc_86_tmp;
  reg [9:0] regs_regs_slc_regs_regs_2_1_itm;
  reg [9:0] regs_regs_slc_regs_regs_2_2_itm;
  reg [9:0] regs_regs_slc_regs_regs_2_itm;
  reg [9:0] regs_regs_slc_regs_regs_2_4_itm;
  reg [9:0] regs_regs_slc_regs_regs_2_5_itm;
  reg [9:0] regs_regs_slc_regs_regs_2_3_itm;
  reg [9:0] regs_regs_slc_regs_regs_2_7_itm;
  reg [9:0] regs_regs_slc_regs_regs_2_8_itm;
  reg [9:0] regs_regs_slc_regs_regs_2_6_itm;
  reg [12:0] ACC1_acc_141_itm_1;
  wire [13:0] nl_ACC1_acc_141_itm_1;
  reg [12:0] MAC3_acc_50_itm_1;
  wire [14:0] nl_MAC3_acc_50_itm_1;
  reg [9:0] MAC3_mul_7_itm_1;
  wire [19:0] nl_MAC3_mul_7_itm_1;
  reg [7:0] MAC3_mul_9_itm_1;
  wire [15:0] nl_MAC3_mul_9_itm_1;
  reg ACC1_1_slc_acc_idiv_1_48_itm_1;
  reg [8:0] count_slc_count_2_itm_1;
  reg main_stage_0_2;
  reg [11:0] ACC1_acc_140_itm_1_sg1;
  wire [12:0] nl_ACC1_acc_140_itm_1_sg1;
  reg ACC1_acc_140_itm_2;
  reg [9:0] MAC3_acc_45_itm_1_sg1;
  wire [10:0] nl_MAC3_acc_45_itm_1_sg1;
  reg [89:0] reg_regs_regs_0_sva_cse;
  wire [13:0] ACC1_acc_psp_sva;
  wire [14:0] nl_ACC1_acc_psp_sva;
  wire [9:0] val_1_lpi_1_dfm;
  wire [13:0] acc_13_psp;
  wire [14:0] nl_acc_13_psp;
  wire [11:0] acc_5_psp_1_sva;
  wire [12:0] nl_acc_5_psp_1_sva;
  wire [11:0] acc_5_psp_sva;
  wire [12:0] nl_acc_5_psp_sva;
  wire [3:0] acc_6_psp_1_sva;
  wire [4:0] nl_acc_6_psp_1_sva;
  wire [2:0] acc_imod_11_sva;
  wire [3:0] nl_acc_imod_11_sva;
  wire [3:0] acc_6_psp_sva;
  wire [4:0] nl_acc_6_psp_sva;
  wire [2:0] acc_imod_4_sva;
  wire [3:0] nl_acc_imod_4_sva;
  wire [11:0] ACC1_1_acc_15_psp_sva;
  wire [12:0] nl_ACC1_1_acc_15_psp_sva;
  wire [11:0] ACC1_1_acc_18_psp_sva;
  wire [12:0] nl_ACC1_1_acc_18_psp_sva;
  wire [11:0] ACC1_3_acc_18_psp_sva;
  wire [12:0] nl_ACC1_3_acc_18_psp_sva;
  wire [11:0] acc_9_psp_2_sva;
  wire [12:0] nl_acc_9_psp_2_sva;
  wire [11:0] acc_1_psp_2_sva;
  wire [12:0] nl_acc_1_psp_2_sva;
  wire [2:0] acc_imod_10_sva;
  wire [3:0] nl_acc_imod_10_sva;
  wire [2:0] acc_imod_14_sva;
  wire [3:0] nl_acc_imod_14_sva;
  wire [3:0] acc_2_psp_2_sva;
  wire [4:0] nl_acc_2_psp_2_sva;
  wire [3:0] acc_10_psp_2_sva;
  wire [4:0] nl_acc_10_psp_2_sva;
  wire [9:0] count_1_sva_1;
  wire [10:0] nl_count_1_sva_1;
  wire [11:0] acc_9_psp_sva;
  wire [12:0] nl_acc_9_psp_sva;
  wire [2:0] acc_imod_7_sva;
  wire [3:0] nl_acc_imod_7_sva;
  wire [3:0] acc_10_psp_sva;
  wire [4:0] nl_acc_10_psp_sva;
  wire [11:0] acc_1_psp_sva;
  wire [12:0] nl_acc_1_psp_sva;
  wire [2:0] acc_imod_1_sva;
  wire [3:0] nl_acc_imod_1_sva;
  wire [3:0] acc_2_psp_sva;
  wire [4:0] nl_acc_2_psp_sva;
  wire [11:0] acc_9_psp_1_sva;
  wire [12:0] nl_acc_9_psp_1_sva;
  wire [2:0] acc_imod_13_sva;
  wire [3:0] nl_acc_imod_13_sva;
  wire [3:0] acc_10_psp_1_sva;
  wire [4:0] nl_acc_10_psp_1_sva;
  wire [11:0] acc_1_psp_1_sva;
  wire [12:0] nl_acc_1_psp_1_sva;
  wire [2:0] acc_imod_9_sva;
  wire [3:0] nl_acc_imod_9_sva;
  wire [3:0] acc_2_psp_1_sva;
  wire [4:0] nl_acc_2_psp_1_sva;
  wire [11:0] ACC1_3_acc_15_itm;
  wire [12:0] nl_ACC1_3_acc_15_itm;

  wire[12:0] abs_mux_1_nl;
  wire[12:0] mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  assign nl_ACC1_acc_psp_sva = conv_s2s_13_14(ACC1_acc_141_itm_1) + conv_s2s_13_14({ACC1_acc_140_itm_1_sg1
      , ACC1_acc_140_itm_2});
  assign ACC1_acc_psp_sva = nl_ACC1_acc_psp_sva[13:0];
  assign nl_MAC3_acc_86_tmp = conv_s2u_12_13(conv_s2s_11_12(conv_s2s_10_11(MAC3_acc_45_itm_1_sg1)
      + conv_s2s_10_11(MAC3_mul_7_itm_1)) + conv_s2s_11_12({MAC3_mul_9_itm_1 , 1'b0
      , ({{1{ACC1_1_slc_acc_idiv_1_48_itm_1}}, ACC1_1_slc_acc_idiv_1_48_itm_1})}))
      + conv_s2u_12_13(MAC3_acc_50_itm_1[12:1]);
  assign MAC3_acc_86_tmp = nl_MAC3_acc_86_tmp[12:0];
  assign val_1_lpi_1_dfm = (acc_13_psp[9:0]) | (signext_10_1(~ (readslicef_14_1_13((acc_13_psp
      + 14'b11110000000001)))));
  assign abs_mux_1_nl = MUX_v_13_2_2({(ACC1_acc_psp_sva[12:0]) , ((~ (ACC1_acc_psp_sva[12:0]))
      + 13'b1)}, ACC1_acc_psp_sva[13]);
  assign mux_2_nl = MUX_v_13_2_2({({(MAC3_acc_86_tmp[11:0]) , (MAC3_acc_50_itm_1[0])})
      , (({(~ (MAC3_acc_86_tmp[11:0])) , (~ (MAC3_acc_50_itm_1[0]))}) + 13'b1)},
      MAC3_acc_86_tmp[12]);
  assign nl_acc_13_psp = conv_u2u_13_14(abs_mux_1_nl) + conv_u2u_13_14(mux_2_nl);
  assign acc_13_psp = nl_acc_13_psp[13:0];
  assign nl_acc_5_psp_1_sva = conv_u2u_11_12(conv_u2u_10_11(vin_rsc_mgc_in_wire_d[49:40])
      + conv_u2u_10_11(vin_rsc_mgc_in_wire_d[39:30])) + conv_u2u_10_12(vin_rsc_mgc_in_wire_d[59:50]);
  assign acc_5_psp_1_sva = nl_acc_5_psp_1_sva[11:0];
  assign nl_acc_5_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_regs_slc_regs_regs_2_4_itm)
      + conv_u2u_10_11(regs_regs_slc_regs_regs_2_5_itm)) + conv_u2u_10_12(regs_regs_slc_regs_regs_2_3_itm);
  assign acc_5_psp_sva = nl_acc_5_psp_sva[11:0];
  assign nl_acc_6_psp_1_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_5_psp_1_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_5_psp_1_sva[4]) , (acc_5_psp_1_sva[8])}))))
      , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_5_psp_1_sva[5]))
      , 1'b1}) + conv_u2u_2_3({(acc_5_psp_1_sva[6]) , (~ (acc_5_psp_1_sva[7]))}))))
      , (acc_5_psp_1_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_5_psp_1_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_5_psp_1_sva[2]) , (~ (acc_5_psp_1_sva[9]))}))))
      , (~ (acc_5_psp_1_sva[11]))})))) + ({3'b101 , (acc_5_psp_1_sva[0])});
  assign acc_6_psp_1_sva = nl_acc_6_psp_1_sva[3:0];
  assign nl_acc_imod_11_sva = conv_s2s_2_3(conv_s2s_1_2(acc_6_psp_1_sva[1]) + conv_u2s_1_2(acc_6_psp_1_sva[0]))
      + conv_s2s_2_3(acc_6_psp_1_sva[3:2]);
  assign acc_imod_11_sva = nl_acc_imod_11_sva[2:0];
  assign nl_acc_6_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_5_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_5_psp_sva[4]) , (acc_5_psp_sva[8])}))))
      , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_5_psp_sva[5]))
      , 1'b1}) + conv_u2u_2_3({(acc_5_psp_sva[6]) , (~ (acc_5_psp_sva[7]))})))) ,
      (acc_5_psp_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_5_psp_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_5_psp_sva[2]) , (~ (acc_5_psp_sva[9]))}))))
      , (~ (acc_5_psp_sva[11]))})))) + ({3'b101 , (acc_5_psp_sva[0])});
  assign acc_6_psp_sva = nl_acc_6_psp_sva[3:0];
  assign nl_acc_imod_4_sva = conv_s2s_2_3(conv_s2s_1_2(acc_6_psp_sva[1]) + conv_u2s_1_2(acc_6_psp_sva[0]))
      + conv_s2s_2_3(acc_6_psp_sva[3:2]);
  assign acc_imod_4_sva = nl_acc_imod_4_sva[2:0];
  assign nl_ACC1_1_acc_15_psp_sva = conv_u2s_10_12({(acc_1_psp_1_sva[11]) , (conv_u2u_8_9({(acc_1_psp_1_sva[11])
      , 1'b0 , (acc_1_psp_1_sva[11]) , 1'b0 , (acc_1_psp_1_sva[11]) , 1'b0 , (signext_2_1(acc_1_psp_1_sva[7]))})
      + conv_u2u_8_9(readslicef_9_8_1((({(acc_1_psp_1_sva[9]) , 1'b0 , (acc_1_psp_1_sva[9])
      , 1'b0 , (acc_1_psp_1_sva[9]) , 1'b0 , (signext_2_1(acc_1_psp_1_sva[5])) ,
      1'b1}) + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_1_psp_1_sva[7])
      , 1'b0 , (acc_1_psp_1_sva[5]) , 1'b0 , (signext_2_1(acc_1_psp_1_sva[9])) ,
      1'b1}) + conv_u2u_6_8({(acc_1_psp_1_sva[6]) , 1'b0 , (acc_1_psp_1_sva[6]) ,
      1'b0 , (acc_1_psp_1_sva[6]) , (acc_imod_9_sva[1])})))) , (~ (readslicef_3_1_2((({1'b1
      , (acc_imod_9_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_9_sva[1])) , (~
      (acc_imod_9_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(acc_1_psp_1_sva[10])
      , 1'b0 , (acc_1_psp_1_sva[10]) , 1'b0 , (acc_1_psp_1_sva[10]) , 1'b0 , (acc_1_psp_1_sva[10])
      , 1'b0 , (acc_1_psp_1_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(acc_1_psp_1_sva[8])
      , 1'b0 , (acc_1_psp_1_sva[8]) , 1'b0 , (acc_1_psp_1_sva[8]) , 1'b0 , (acc_1_psp_1_sva[8])
      , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((conv_u2s_3_4({(acc_1_psp_1_sva[3])
      , (acc_1_psp_1_sva[1]) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_1_psp_1_sva[2])
      , (acc_1_psp_1_sva[3])})))) , 1'b1}) + conv_s2s_3_5({(acc_2_psp_1_sva[3:2])
      , (acc_1_psp_1_sva[4])})))) , 1'b1}) + conv_u2s_5_7({(acc_1_psp_1_sva[7]) ,
      (acc_1_psp_1_sva[4]) , (signext_2_1(acc_1_psp_1_sva[11])) , (acc_2_psp_1_sva[1])}))))
      , (~ (acc_imod_9_sva[2]))})))));
  assign ACC1_1_acc_15_psp_sva = nl_ACC1_1_acc_15_psp_sva[11:0];
  assign nl_ACC1_1_acc_18_psp_sva = conv_u2s_10_12({(acc_9_psp_1_sva[11]) , (conv_u2u_8_9({(acc_9_psp_1_sva[11])
      , 1'b0 , (acc_9_psp_1_sva[11]) , 1'b0 , (acc_9_psp_1_sva[11]) , 1'b0 , (signext_2_1(acc_9_psp_1_sva[7]))})
      + conv_u2u_8_9(readslicef_9_8_1((({(acc_9_psp_1_sva[9]) , 1'b0 , (acc_9_psp_1_sva[9])
      , 1'b0 , (acc_9_psp_1_sva[9]) , 1'b0 , (signext_2_1(acc_9_psp_1_sva[5])) ,
      1'b1}) + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_9_psp_1_sva[7])
      , 1'b0 , (acc_9_psp_1_sva[5]) , 1'b0 , (signext_2_1(acc_9_psp_1_sva[9])) ,
      1'b1}) + conv_u2u_6_8({(acc_9_psp_1_sva[6]) , 1'b0 , (acc_9_psp_1_sva[6]) ,
      1'b0 , (acc_9_psp_1_sva[6]) , (acc_imod_13_sva[1])})))) , (~ (readslicef_3_1_2((({1'b1
      , (acc_imod_13_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_13_sva[1])) ,
      (~ (acc_imod_13_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(acc_9_psp_1_sva[10])
      , 1'b0 , (acc_9_psp_1_sva[10]) , 1'b0 , (acc_9_psp_1_sva[10]) , 1'b0 , (acc_9_psp_1_sva[10])
      , 1'b0 , (acc_9_psp_1_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(acc_9_psp_1_sva[8])
      , 1'b0 , (acc_9_psp_1_sva[8]) , 1'b0 , (acc_9_psp_1_sva[8]) , 1'b0 , (acc_9_psp_1_sva[8])
      , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((conv_u2s_3_4({(acc_9_psp_1_sva[3])
      , (acc_9_psp_1_sva[1]) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_9_psp_1_sva[2])
      , (acc_9_psp_1_sva[3])})))) , 1'b1}) + conv_s2s_3_5({(acc_10_psp_1_sva[3:2])
      , (acc_9_psp_1_sva[4])})))) , 1'b1}) + conv_u2s_5_7({(acc_9_psp_1_sva[7]) ,
      (acc_9_psp_1_sva[4]) , (signext_2_1(acc_9_psp_1_sva[11])) , (acc_10_psp_1_sva[1])}))))
      , (~ (acc_imod_13_sva[2]))})))));
  assign ACC1_1_acc_18_psp_sva = nl_ACC1_1_acc_18_psp_sva[11:0];
  assign nl_ACC1_3_acc_18_psp_sva = conv_u2s_10_12({(acc_9_psp_sva[11]) , (conv_u2u_8_9({(acc_9_psp_sva[11])
      , 1'b0 , (acc_9_psp_sva[11]) , 1'b0 , (acc_9_psp_sva[11]) , 1'b0 , (signext_2_1(acc_9_psp_sva[7]))})
      + conv_u2u_8_9(readslicef_9_8_1((({(acc_9_psp_sva[9]) , 1'b0 , (acc_9_psp_sva[9])
      , 1'b0 , (acc_9_psp_sva[9]) , 1'b0 , (signext_2_1(acc_9_psp_sva[5])) , 1'b1})
      + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_9_psp_sva[7]) , 1'b0
      , (acc_9_psp_sva[5]) , 1'b0 , (signext_2_1(acc_9_psp_sva[9])) , 1'b1}) + conv_u2u_6_8({(acc_9_psp_sva[6])
      , 1'b0 , (acc_9_psp_sva[6]) , 1'b0 , (acc_9_psp_sva[6]) , (acc_imod_7_sva[1])}))))
      , (~ (readslicef_3_1_2((({1'b1 , (acc_imod_7_sva[0]) , 1'b1}) + conv_u2s_2_3({(~
      (acc_imod_7_sva[1])) , (~ (acc_imod_7_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(acc_9_psp_sva[10])
      , 1'b0 , (acc_9_psp_sva[10]) , 1'b0 , (acc_9_psp_sva[10]) , 1'b0 , (acc_9_psp_sva[10])
      , 1'b0 , (acc_9_psp_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(acc_9_psp_sva[8])
      , 1'b0 , (acc_9_psp_sva[8]) , 1'b0 , (acc_9_psp_sva[8]) , 1'b0 , (acc_9_psp_sva[8])
      , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((conv_u2s_3_4({(acc_9_psp_sva[3])
      , (acc_9_psp_sva[1]) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_9_psp_sva[2]) , (acc_9_psp_sva[3])}))))
      , 1'b1}) + conv_s2s_3_5({(acc_10_psp_sva[3:2]) , (acc_9_psp_sva[4])})))) ,
      1'b1}) + conv_u2s_5_7({(acc_9_psp_sva[7]) , (acc_9_psp_sva[4]) , (signext_2_1(acc_9_psp_sva[11]))
      , (acc_10_psp_sva[1])})))) , (~ (acc_imod_7_sva[2]))})))));
  assign ACC1_3_acc_18_psp_sva = nl_ACC1_3_acc_18_psp_sva[11:0];
  assign nl_acc_9_psp_2_sva = conv_u2u_11_12(conv_u2u_10_11(reg_regs_regs_0_sva_cse[19:10])
      + conv_u2u_10_11(reg_regs_regs_0_sva_cse[9:0])) + conv_u2u_10_12(reg_regs_regs_0_sva_cse[29:20]);
  assign acc_9_psp_2_sva = nl_acc_9_psp_2_sva[11:0];
  assign nl_acc_1_psp_2_sva = conv_u2u_11_12(conv_u2u_10_11(reg_regs_regs_0_sva_cse[79:70])
      + conv_u2u_10_11(reg_regs_regs_0_sva_cse[69:60])) + conv_u2u_10_12(reg_regs_regs_0_sva_cse[89:80]);
  assign acc_1_psp_2_sva = nl_acc_1_psp_2_sva[11:0];
  assign nl_acc_imod_10_sva = conv_s2s_2_3(conv_s2s_1_2(acc_2_psp_2_sva[1]) + conv_u2s_1_2(acc_2_psp_2_sva[0]))
      + conv_s2s_2_3(acc_2_psp_2_sva[3:2]);
  assign acc_imod_10_sva = nl_acc_imod_10_sva[2:0];
  assign nl_acc_imod_14_sva = conv_s2s_2_3(conv_s2s_1_2(acc_10_psp_2_sva[1]) + conv_u2s_1_2(acc_10_psp_2_sva[0]))
      + conv_s2s_2_3(acc_10_psp_2_sva[3:2]);
  assign acc_imod_14_sva = nl_acc_imod_14_sva[2:0];
  assign nl_acc_2_psp_2_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_1_psp_2_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_1_psp_2_sva[4]) , (acc_1_psp_2_sva[8])}))))
      , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_1_psp_2_sva[5]))
      , 1'b1}) + conv_u2u_2_3({(acc_1_psp_2_sva[6]) , (~ (acc_1_psp_2_sva[7]))}))))
      , (acc_1_psp_2_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_1_psp_2_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_1_psp_2_sva[2]) , (~ (acc_1_psp_2_sva[9]))}))))
      , (~ (acc_1_psp_2_sva[11]))})))) + ({3'b101 , (acc_1_psp_2_sva[0])});
  assign acc_2_psp_2_sva = nl_acc_2_psp_2_sva[3:0];
  assign nl_acc_10_psp_2_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_9_psp_2_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_9_psp_2_sva[4]) , (acc_9_psp_2_sva[8])}))))
      , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_9_psp_2_sva[5]))
      , 1'b1}) + conv_u2u_2_3({(acc_9_psp_2_sva[6]) , (~ (acc_9_psp_2_sva[7]))}))))
      , (acc_9_psp_2_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_9_psp_2_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_9_psp_2_sva[2]) , (~ (acc_9_psp_2_sva[9]))}))))
      , (~ (acc_9_psp_2_sva[11]))})))) + ({3'b101 , (acc_9_psp_2_sva[0])});
  assign acc_10_psp_2_sva = nl_acc_10_psp_2_sva[3:0];
  assign nl_count_1_sva_1 = conv_u2s_9_10(count_slc_count_2_itm_1) + 10'b1;
  assign count_1_sva_1 = nl_count_1_sva_1[9:0];
  assign nl_acc_9_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_regs_slc_regs_regs_2_7_itm)
      + conv_u2u_10_11(regs_regs_slc_regs_regs_2_8_itm)) + conv_u2u_10_12(regs_regs_slc_regs_regs_2_6_itm);
  assign acc_9_psp_sva = nl_acc_9_psp_sva[11:0];
  assign nl_acc_imod_7_sva = conv_s2s_2_3(conv_s2s_1_2(acc_10_psp_sva[1]) + conv_u2s_1_2(acc_10_psp_sva[0]))
      + conv_s2s_2_3(acc_10_psp_sva[3:2]);
  assign acc_imod_7_sva = nl_acc_imod_7_sva[2:0];
  assign nl_acc_10_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_9_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_9_psp_sva[4]) , (acc_9_psp_sva[8])}))))
      , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_9_psp_sva[5]))
      , 1'b1}) + conv_u2u_2_3({(acc_9_psp_sva[6]) , (~ (acc_9_psp_sva[7]))})))) ,
      (acc_9_psp_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_9_psp_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_9_psp_sva[2]) , (~ (acc_9_psp_sva[9]))}))))
      , (~ (acc_9_psp_sva[11]))})))) + ({3'b101 , (acc_9_psp_sva[0])});
  assign acc_10_psp_sva = nl_acc_10_psp_sva[3:0];
  assign nl_acc_1_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_regs_slc_regs_regs_2_1_itm)
      + conv_u2u_10_11(regs_regs_slc_regs_regs_2_2_itm)) + conv_u2u_10_12(regs_regs_slc_regs_regs_2_itm);
  assign acc_1_psp_sva = nl_acc_1_psp_sva[11:0];
  assign nl_acc_imod_1_sva = conv_s2s_2_3(conv_s2s_1_2(acc_2_psp_sva[1]) + conv_u2s_1_2(acc_2_psp_sva[0]))
      + conv_s2s_2_3(acc_2_psp_sva[3:2]);
  assign acc_imod_1_sva = nl_acc_imod_1_sva[2:0];
  assign nl_acc_2_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_1_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_1_psp_sva[4]) , (acc_1_psp_sva[8])}))))
      , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_1_psp_sva[5]))
      , 1'b1}) + conv_u2u_2_3({(acc_1_psp_sva[6]) , (~ (acc_1_psp_sva[7]))})))) ,
      (acc_1_psp_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_1_psp_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_1_psp_sva[2]) , (~ (acc_1_psp_sva[9]))}))))
      , (~ (acc_1_psp_sva[11]))})))) + ({3'b101 , (acc_1_psp_sva[0])});
  assign acc_2_psp_sva = nl_acc_2_psp_sva[3:0];
  assign nl_acc_9_psp_1_sva = conv_u2u_11_12(conv_u2u_10_11(vin_rsc_mgc_in_wire_d[19:10])
      + conv_u2u_10_11(vin_rsc_mgc_in_wire_d[9:0])) + conv_u2u_10_12(vin_rsc_mgc_in_wire_d[29:20]);
  assign acc_9_psp_1_sva = nl_acc_9_psp_1_sva[11:0];
  assign nl_acc_imod_13_sva = conv_s2s_2_3(conv_s2s_1_2(acc_10_psp_1_sva[1]) + conv_u2s_1_2(acc_10_psp_1_sva[0]))
      + conv_s2s_2_3(acc_10_psp_1_sva[3:2]);
  assign acc_imod_13_sva = nl_acc_imod_13_sva[2:0];
  assign nl_acc_10_psp_1_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_9_psp_1_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_9_psp_1_sva[4]) , (acc_9_psp_1_sva[8])}))))
      , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_9_psp_1_sva[5]))
      , 1'b1}) + conv_u2u_2_3({(acc_9_psp_1_sva[6]) , (~ (acc_9_psp_1_sva[7]))}))))
      , (acc_9_psp_1_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_9_psp_1_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_9_psp_1_sva[2]) , (~ (acc_9_psp_1_sva[9]))}))))
      , (~ (acc_9_psp_1_sva[11]))})))) + ({3'b101 , (acc_9_psp_1_sva[0])});
  assign acc_10_psp_1_sva = nl_acc_10_psp_1_sva[3:0];
  assign nl_acc_1_psp_1_sva = conv_u2u_11_12(conv_u2u_10_11(vin_rsc_mgc_in_wire_d[79:70])
      + conv_u2u_10_11(vin_rsc_mgc_in_wire_d[69:60])) + conv_u2u_10_12(vin_rsc_mgc_in_wire_d[89:80]);
  assign acc_1_psp_1_sva = nl_acc_1_psp_1_sva[11:0];
  assign nl_acc_imod_9_sva = conv_s2s_2_3(conv_s2s_1_2(acc_2_psp_1_sva[1]) + conv_u2s_1_2(acc_2_psp_1_sva[0]))
      + conv_s2s_2_3(acc_2_psp_1_sva[3:2]);
  assign acc_imod_9_sva = nl_acc_imod_9_sva[2:0];
  assign nl_acc_2_psp_1_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_1_psp_1_sva[3])) , 1'b1}) + conv_u2u_2_3({(acc_1_psp_1_sva[4]) , (acc_1_psp_1_sva[8])}))))
      , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~ (acc_1_psp_1_sva[5]))
      , 1'b1}) + conv_u2u_2_3({(acc_1_psp_1_sva[6]) , (~ (acc_1_psp_1_sva[7]))}))))
      , (acc_1_psp_1_sva[10])})))) , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_1_psp_1_sva[1])) , 1'b1}) + conv_u2u_2_3({(acc_1_psp_1_sva[2]) , (~ (acc_1_psp_1_sva[9]))}))))
      , (~ (acc_1_psp_1_sva[11]))})))) + ({3'b101 , (acc_1_psp_1_sva[0])});
  assign acc_2_psp_1_sva = nl_acc_2_psp_1_sva[3:0];
  assign nl_ACC1_3_acc_15_itm = conv_u2s_10_12({(acc_1_psp_sva[11]) , (conv_u2u_8_9({(acc_1_psp_sva[11])
      , 1'b0 , (acc_1_psp_sva[11]) , 1'b0 , (acc_1_psp_sva[11]) , 1'b0 , (signext_2_1(acc_1_psp_sva[7]))})
      + conv_u2u_8_9(readslicef_9_8_1((({(acc_1_psp_sva[9]) , 1'b0 , (acc_1_psp_sva[9])
      , 1'b0 , (acc_1_psp_sva[9]) , 1'b0 , (signext_2_1(acc_1_psp_sva[5])) , 1'b1})
      + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_1_psp_sva[7]) , 1'b0
      , (acc_1_psp_sva[5]) , 1'b0 , (signext_2_1(acc_1_psp_sva[9])) , 1'b1}) + conv_u2u_6_8({(acc_1_psp_sva[6])
      , 1'b0 , (acc_1_psp_sva[6]) , 1'b0 , (acc_1_psp_sva[6]) , (acc_imod_1_sva[1])}))))
      , (~ (readslicef_3_1_2((({1'b1 , (acc_imod_1_sva[0]) , 1'b1}) + conv_u2s_2_3({(~
      (acc_imod_1_sva[1])) , (~ (acc_imod_1_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(acc_1_psp_sva[10])
      , 1'b0 , (acc_1_psp_sva[10]) , 1'b0 , (acc_1_psp_sva[10]) , 1'b0 , (acc_1_psp_sva[10])
      , 1'b0 , (acc_1_psp_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(acc_1_psp_sva[8])
      , 1'b0 , (acc_1_psp_sva[8]) , 1'b0 , (acc_1_psp_sva[8]) , 1'b0 , (acc_1_psp_sva[8])
      , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((conv_u2s_3_4({(acc_1_psp_sva[3])
      , (acc_1_psp_sva[1]) , 1'b1}) + conv_s2s_3_4({1'b1 , (acc_1_psp_sva[2]) , (acc_1_psp_sva[3])}))))
      , 1'b1}) + conv_s2s_3_5({(acc_2_psp_sva[3:2]) , (acc_1_psp_sva[4])})))) , 1'b1})
      + conv_u2s_5_7({(acc_1_psp_sva[7]) , (acc_1_psp_sva[4]) , (signext_2_1(acc_1_psp_sva[11]))
      , (acc_2_psp_sva[1])})))) , (~ (acc_imod_1_sva[2]))})))));
  assign ACC1_3_acc_15_itm = nl_ACC1_3_acc_15_itm[11:0];
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      counter_rsc_mgc_out_stdreg_d <= 16'b0;
      vout_rsc_mgc_out_stdreg_d <= 30'b0;
      MAC3_acc_50_itm_1 <= 13'b0;
      count_slc_count_2_itm_1 <= 9'b0;
      MAC3_acc_45_itm_1_sg1 <= 10'b0;
      MAC3_mul_7_itm_1 <= 10'b0;
      MAC3_mul_9_itm_1 <= 8'b0;
      ACC1_1_slc_acc_idiv_1_48_itm_1 <= 1'b0;
      ACC1_acc_141_itm_1 <= 13'b0;
      ACC1_acc_140_itm_1_sg1 <= 12'b0;
      ACC1_acc_140_itm_2 <= 1'b0;
      main_stage_0_2 <= 1'b0;
      regs_regs_slc_regs_regs_2_7_itm <= 10'b0;
      regs_regs_slc_regs_regs_2_8_itm <= 10'b0;
      regs_regs_slc_regs_regs_2_6_itm <= 10'b0;
      regs_regs_slc_regs_regs_2_4_itm <= 10'b0;
      regs_regs_slc_regs_regs_2_5_itm <= 10'b0;
      regs_regs_slc_regs_regs_2_3_itm <= 10'b0;
      regs_regs_slc_regs_regs_2_1_itm <= 10'b0;
      regs_regs_slc_regs_regs_2_2_itm <= 10'b0;
      regs_regs_slc_regs_regs_2_itm <= 10'b0;
      reg_regs_regs_0_sva_cse <= 90'b0;
    end
    else begin
      if ( en ) begin
        counter_rsc_mgc_out_stdreg_d <= MUX_v_16_2_2({counter_rsc_mgc_out_stdreg_d
            , ({7'b0 , count_slc_count_2_itm_1})}, main_stage_0_2);
        vout_rsc_mgc_out_stdreg_d <= MUX_v_30_2_2({vout_rsc_mgc_out_stdreg_d , ({val_1_lpi_1_dfm
            , val_1_lpi_1_dfm , val_1_lpi_1_dfm})}, main_stage_0_2);
        MAC3_acc_50_itm_1 <= nl_MAC3_acc_50_itm_1[12:0];
        count_slc_count_2_itm_1 <= (count_1_sva_1[8:0]) & (signext_9_1(readslicef_8_1_7(((count_1_sva_1[9:2])
            + 8'b10000011))));
        MAC3_acc_45_itm_1_sg1 <= nl_MAC3_acc_45_itm_1_sg1[9:0];
        MAC3_mul_7_itm_1 <= nl_MAC3_mul_7_itm_1[9:0];
        MAC3_mul_9_itm_1 <= nl_MAC3_mul_9_itm_1[7:0];
        ACC1_1_slc_acc_idiv_1_48_itm_1 <= acc_5_psp_1_sva[5];
        ACC1_acc_141_itm_1 <= nl_ACC1_acc_141_itm_1[12:0];
        ACC1_acc_140_itm_1_sg1 <= nl_ACC1_acc_140_itm_1_sg1[11:0];
        ACC1_acc_140_itm_2 <= ACC1_3_acc_18_psp_sva[0];
        main_stage_0_2 <= 1'b1;
        regs_regs_slc_regs_regs_2_7_itm <= reg_regs_regs_0_sva_cse[19:10];
        regs_regs_slc_regs_regs_2_8_itm <= reg_regs_regs_0_sva_cse[9:0];
        regs_regs_slc_regs_regs_2_6_itm <= reg_regs_regs_0_sva_cse[29:20];
        regs_regs_slc_regs_regs_2_4_itm <= reg_regs_regs_0_sva_cse[49:40];
        regs_regs_slc_regs_regs_2_5_itm <= reg_regs_regs_0_sva_cse[39:30];
        regs_regs_slc_regs_regs_2_3_itm <= reg_regs_regs_0_sva_cse[59:50];
        regs_regs_slc_regs_regs_2_1_itm <= reg_regs_regs_0_sva_cse[79:70];
        regs_regs_slc_regs_regs_2_2_itm <= reg_regs_regs_0_sva_cse[69:60];
        regs_regs_slc_regs_regs_2_itm <= reg_regs_regs_0_sva_cse[89:80];
        reg_regs_regs_0_sva_cse <= vin_rsc_mgc_in_wire_d;
      end
    end
  end
  assign nl_MAC3_acc_50_itm_1  = (conv_s2s_12_13(ACC1_1_acc_15_psp_sva) + conv_s2s_12_13(ACC1_1_acc_18_psp_sva))
      + (conv_s2s_12_13(~ ACC1_3_acc_15_itm) + conv_s2s_12_13(~ ACC1_3_acc_18_psp_sva));
  assign nl_MAC3_acc_45_itm_1_sg1  = conv_s2u_9_10(conv_s2s_8_9(conv_s2s_6_8(conv_s2s_12_6(conv_s2s_2_6(conv_s2s_1_2(acc_5_psp_sva[6])
      + conv_u2s_1_2(acc_5_psp_1_sva[6])) * 6'b10101)) + conv_u2s_6_8({(acc_5_psp_1_sva[7])
      , 1'b0 , (acc_5_psp_1_sva[5]) , 1'b0 , (signext_2_1(acc_5_psp_1_sva[7]))}))
      + conv_s2s_8_9(conv_s2s_16_8(conv_s2s_2_8(conv_s2s_1_2(acc_5_psp_sva[8]) +
      conv_u2s_1_2(acc_5_psp_1_sva[8])) * 8'b1010101))) + conv_s2u_9_10(conv_s2s_8_9(8'b10100111
      + conv_u2s_7_8(readslicef_8_7_1((({(readslicef_8_7_1((conv_u2u_7_8({(~ (acc_5_psp_sva[7]))
      , 1'b1 , (~ (acc_5_psp_sva[5:4])) , 1'b1 , (~ (acc_5_psp_sva[2])) , 1'b1})
      + conv_u2u_6_8({(readslicef_6_5_1((conv_u2u_5_6({(~ (acc_5_psp_sva[7])) , (~
      (acc_5_psp_sva[3])) , 1'b1 , (~ (acc_5_psp_sva[1])) , 1'b1}) + conv_u2u_5_6({(acc_5_psp_1_sva[7])
      , (acc_5_psp_1_sva[4]) , (signext_2_1(~ (acc_5_psp_sva[5]))) , (~ (acc_6_psp_sva[1]))}))))
      , (acc_imod_4_sva[2])})))) , 1'b1}) + conv_s2u_7_8({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(readslicef_4_3_1((({1'b1
      , (signext_2_1(~ (acc_5_psp_sva[11]))) , 1'b1}) + conv_u2s_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (acc_5_psp_sva[4])) , 1'b1}) + conv_u2u_2_3({(acc_5_psp_1_sva[1]) , (acc_5_psp_1_sva[2])}))))
      , (acc_imod_11_sva[1])})))) , 1'b1}) + conv_s2s_4_5({(readslicef_4_3_1((conv_s2s_3_4({(acc_6_psp_1_sva[3:2])
      , 1'b1}) + conv_s2s_3_4({(~ (acc_6_psp_sva[3:2])) , (acc_6_psp_1_sva[1])}))))
      , (~ (readslicef_3_1_2((({1'b1 , (acc_imod_11_sva[0]) , 1'b1}) + conv_u2s_2_3({(~
      (acc_imod_11_sva[1])) , (~ (acc_imod_11_sva[2]))})))))})))) , 1'b1}) + conv_u2s_5_7({(readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(~
      (acc_5_psp_sva[7])) , 1'b1})) + conv_u2u_3_4(signext_3_2({(~ (acc_5_psp_sva[9]))
      , (acc_5_psp_1_sva[4])}))))) , 1'b1}) + conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(acc_5_psp_1_sva[9])
      , 1'b1})) + conv_u2u_3_4({(acc_5_psp_1_sva[3]) , (acc_5_psp_sva[3]) , (acc_5_psp_1_sva[3])}))))
      , (~ (acc_imod_11_sva[2]))})))) , (~ (acc_imod_4_sva[1]))})))) , (readslicef_3_1_2((({1'b1
      , (acc_imod_4_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_4_sva[1])) , (~
      (acc_imod_4_sva[2]))}))))}))))) + ({conv_u2u_12_6(conv_s2s_2_6(conv_s2s_1_2(acc_5_psp_sva[9])
      + conv_u2s_1_2(acc_5_psp_1_sva[9])) * 6'b10101) , 1'b0 , (signext_2_1(acc_5_psp_1_sva[11]))}));
  assign nl_MAC3_mul_7_itm_1  = conv_s2s_2_10(conv_s2s_1_2(acc_5_psp_sva[10]) + conv_u2s_1_2(acc_5_psp_1_sva[10]))
      * 10'b101010101;
  assign nl_MAC3_mul_9_itm_1  = conv_s2s_2_8(conv_s2s_1_2(acc_5_psp_sva[11]) + conv_u2s_1_2(acc_5_psp_1_sva[11]))
      * 8'b1010101;
  assign nl_ACC1_acc_141_itm_1  = ({(conv_s2u_11_12({conv_s2u_16_8(conv_s2s_2_8(conv_s2s_1_2(acc_9_psp_2_sva[11])
      + conv_u2s_1_2(acc_1_psp_2_sva[11])) * 8'b10101011) , 1'b0 , (signext_2_1(acc_9_psp_2_sva[11]))})
      + conv_s2u_11_12(~ (ACC1_1_acc_15_psp_sva[11:1]))) , (~ (ACC1_1_acc_15_psp_sva[0]))})
      + conv_s2s_12_13(ACC1_1_acc_18_psp_sva + (~ ACC1_3_acc_15_itm));
  assign nl_ACC1_acc_140_itm_1_sg1  = conv_s2u_11_12((ACC1_3_acc_18_psp_sva[11:1])
      + conv_s2s_8_11(readslicef_9_8_1((({1'b1 , (readslicef_8_7_1((conv_u2s_7_8({5'b10001
      , (acc_9_psp_2_sva[2]) , 1'b1}) + ({(readslicef_8_7_1((conv_s2s_7_8({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_3_5({(acc_10_psp_2_sva[3:2])
      , 1'b1}) + conv_u2s_3_5(signext_3_2({(acc_9_psp_2_sva[7]) , (acc_9_psp_2_sva[4])})))))
      , 1'b1}) + conv_u2s_5_7({(acc_9_psp_2_sva[7]) , (acc_9_psp_2_sva[4]) , (signext_2_1(acc_9_psp_2_sva[5]))
      , (~ (acc_imod_10_sva[1]))})))) , 1'b1}) + conv_s2s_7_8({conv_s2u_12_6(conv_s2s_2_6(conv_s2s_1_2(acc_9_psp_2_sva[6])
      + conv_u2s_1_2(acc_1_psp_2_sva[6])) * 6'b101011) , (acc_imod_14_sva[1])}))))
      , (~ (readslicef_3_1_2((({1'b1 , (acc_imod_14_sva[0]) , 1'b1}) + conv_u2s_2_3({(~
      (acc_imod_14_sva[1])) , (~ (acc_imod_14_sva[2]))})))))})))) , 1'b1}) + ({(readslicef_9_8_1((conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(acc_9_psp_2_sva[7])
      , 1'b0 , (acc_9_psp_2_sva[5]) , 1'b0 , (signext_2_1(acc_9_psp_2_sva[9])) ,
      1'b1}) + conv_u2u_7_8({(~ (acc_1_psp_2_sva[7])) , 1'b1 , (~ (acc_1_psp_2_sva[5:4]))
      , 1'b1 , (~ (acc_1_psp_2_sva[2])) , (readslicef_3_1_2((({1'b1 , (acc_imod_10_sva[0])
      , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_10_sva[1])) , (~ (acc_imod_10_sva[2]))}))))}))))
      , 1'b1}) + conv_u2u_7_9({(readslicef_7_6_1((conv_u2u_6_7({(readslicef_6_5_1((conv_u2u_5_6({(~
      (acc_1_psp_2_sva[7])) , (~ (acc_1_psp_2_sva[3])) , 1'b1 , (~ (acc_1_psp_2_sva[1]))
      , 1'b1}) + conv_u2u_4_6({(readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(~ (acc_1_psp_2_sva[5]))
      , 1'b1})) + conv_u2u_3_4(signext_3_2({(~ (acc_1_psp_2_sva[7])) , (acc_9_psp_2_sva[3])})))))
      , (~ (acc_1_psp_2_sva[4]))})))) , 1'b1}) + conv_s2u_6_7({(readslicef_6_5_1((conv_u2s_4_6({(readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(~
      (acc_1_psp_2_sva[9])) , 1'b1})) + conv_u2u_3_4({(acc_9_psp_2_sva[3]) , (acc_9_psp_2_sva[1])
      , 1'b1})))) , 1'b1}) + conv_s2s_3_6({(~ (acc_2_psp_2_sva[3:2])) , (acc_1_psp_2_sva[3])}))))
      , (acc_imod_10_sva[2])})))) , (~ (acc_imod_14_sva[2]))})))) , (acc_10_psp_2_sva[1])})))))
      + conv_s2u_11_12(conv_s2s_10_11(readslicef_11_10_1((conv_s2s_10_11({conv_s2u_12_6(conv_s2s_2_6(conv_s2s_1_2(acc_9_psp_2_sva[9])
      + conv_u2s_1_2(acc_1_psp_2_sva[9])) * 6'b101011) , 1'b0 , (signext_2_1(~ (acc_1_psp_2_sva[11])))
      , 1'b1}) + conv_s2s_9_11({conv_s2u_16_8(conv_s2s_2_8(conv_s2s_1_2(acc_9_psp_2_sva[8])
      + conv_u2s_1_2(acc_1_psp_2_sva[8])) * 8'b10101011) , (~ (acc_2_psp_2_sva[1]))}))))
      + conv_s2s_10_11(conv_s2s_20_10(conv_s2s_2_10(conv_s2s_1_2(acc_9_psp_2_sva[10])
      + conv_u2s_1_2(acc_1_psp_2_sva[10])) * 10'b1010101011)));

  function [0:0] readslicef_14_1_13;
    input [13:0] vector;
    reg [13:0] tmp;
  begin
    tmp = vector >> 13;
    readslicef_14_1_13 = tmp[0:0];
  end
  endfunction


  function [9:0] signext_10_1;
    input [0:0] vector;
  begin
    signext_10_1= {{9{vector[0]}}, vector};
  end
  endfunction


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


  function [15:0] MUX_v_16_2_2;
    input [31:0] inputs;
    input [0:0] sel;
    reg [15:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[31:16];
      end
      1'b1 : begin
        result = inputs[15:0];
      end
      default : begin
        result = inputs[31:16];
      end
    endcase
    MUX_v_16_2_2 = result;
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


  function [0:0] readslicef_8_1_7;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_8_1_7 = tmp[0:0];
  end
  endfunction


  function [8:0] signext_9_1;
    input [0:0] vector;
  begin
    signext_9_1= {{8{vector[0]}}, vector};
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


  function [2:0] signext_3_2;
    input [1:0] vector;
  begin
    signext_3_2= {{1{vector[1]}}, vector};
  end
  endfunction


  function [9:0] readslicef_11_10_1;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_11_10_1 = tmp[9:0];
  end
  endfunction


  function signed [13:0] conv_s2s_13_14 ;
    input signed [12:0]  vector ;
  begin
    conv_s2s_13_14 = {vector[12], vector};
  end
  endfunction


  function  [12:0] conv_s2u_12_13 ;
    input signed [11:0]  vector ;
  begin
    conv_s2u_12_13 = {vector[11], vector};
  end
  endfunction


  function signed [11:0] conv_s2s_11_12 ;
    input signed [10:0]  vector ;
  begin
    conv_s2s_11_12 = {vector[10], vector};
  end
  endfunction


  function signed [10:0] conv_s2s_10_11 ;
    input signed [9:0]  vector ;
  begin
    conv_s2s_10_11 = {vector[9], vector};
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


  function signed [12:0] conv_s2s_12_13 ;
    input signed [11:0]  vector ;
  begin
    conv_s2s_12_13 = {vector[11], vector};
  end
  endfunction


  function  [9:0] conv_s2u_9_10 ;
    input signed [8:0]  vector ;
  begin
    conv_s2u_9_10 = {vector[8], vector};
  end
  endfunction


  function signed [8:0] conv_s2s_8_9 ;
    input signed [7:0]  vector ;
  begin
    conv_s2s_8_9 = {vector[7], vector};
  end
  endfunction


  function signed [7:0] conv_s2s_6_8 ;
    input signed [5:0]  vector ;
  begin
    conv_s2s_6_8 = {{2{vector[5]}}, vector};
  end
  endfunction


  function signed [5:0] conv_s2s_12_6 ;
    input signed [11:0]  vector ;
  begin
    conv_s2s_12_6 = vector[5:0];
  end
  endfunction


  function signed [5:0] conv_s2s_2_6 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_6 = {{4{vector[1]}}, vector};
  end
  endfunction


  function signed [7:0] conv_u2s_6_8 ;
    input [5:0]  vector ;
  begin
    conv_u2s_6_8 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [7:0] conv_s2s_16_8 ;
    input signed [15:0]  vector ;
  begin
    conv_s2s_16_8 = vector[7:0];
  end
  endfunction


  function signed [7:0] conv_s2s_2_8 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_8 = {{6{vector[1]}}, vector};
  end
  endfunction


  function signed [7:0] conv_u2s_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2s_7_8 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_6 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_s2u_7_8 ;
    input signed [6:0]  vector ;
  begin
    conv_s2u_7_8 = {vector[6], vector};
  end
  endfunction


  function  [5:0] conv_u2u_12_6 ;
    input [11:0]  vector ;
  begin
    conv_u2u_12_6 = vector[5:0];
  end
  endfunction


  function signed [9:0] conv_s2s_2_10 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_10 = {{8{vector[1]}}, vector};
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


  function signed [10:0] conv_s2s_8_11 ;
    input signed [7:0]  vector ;
  begin
    conv_s2s_8_11 = {{3{vector[7]}}, vector};
  end
  endfunction


  function signed [7:0] conv_s2s_7_8 ;
    input signed [6:0]  vector ;
  begin
    conv_s2s_7_8 = {vector[6], vector};
  end
  endfunction


  function signed [4:0] conv_u2s_3_5 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_5 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [5:0] conv_s2u_12_6 ;
    input signed [11:0]  vector ;
  begin
    conv_s2u_12_6 = vector[5:0];
  end
  endfunction


  function  [8:0] conv_u2u_7_9 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_9 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_7 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_4_6 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_6 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_s2u_6_7 ;
    input signed [5:0]  vector ;
  begin
    conv_s2u_6_7 = {vector[5], vector};
  end
  endfunction


  function signed [5:0] conv_u2s_4_6 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_6 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [5:0] conv_s2s_3_6 ;
    input signed [2:0]  vector ;
  begin
    conv_s2s_3_6 = {{3{vector[2]}}, vector};
  end
  endfunction


  function signed [10:0] conv_s2s_9_11 ;
    input signed [8:0]  vector ;
  begin
    conv_s2s_9_11 = {{2{vector[8]}}, vector};
  end
  endfunction


  function signed [9:0] conv_s2s_20_10 ;
    input signed [19:0]  vector ;
  begin
    conv_s2s_20_10 = vector[9:0];
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    mean_vga
//  Generated from file(s):
//    4) $PROJECT_HOME/../capture-save_edge_image_source/sob_save.c
// ------------------------------------------------------------------


module mean_vga (
  vin_rsc_z, vout_rsc_z, counter_rsc_z, clk, en, arst_n
);
  input [89:0] vin_rsc_z;
  output [29:0] vout_rsc_z;
  output [15:0] counter_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [89:0] vin_rsc_mgc_in_wire_d;
  wire [29:0] vout_rsc_mgc_out_stdreg_d;
  wire [15:0] counter_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(90)) vin_rsc_mgc_in_wire (
      .d(vin_rsc_mgc_in_wire_d),
      .z(vin_rsc_z)
    );
  mgc_out_stdreg #(.rscid(2),
  .width(30)) vout_rsc_mgc_out_stdreg (
      .d(vout_rsc_mgc_out_stdreg_d),
      .z(vout_rsc_z)
    );
  mgc_out_stdreg #(.rscid(3),
  .width(16)) counter_rsc_mgc_out_stdreg (
      .d(counter_rsc_mgc_out_stdreg_d),
      .z(counter_rsc_z)
    );
  mean_vga_core mean_vga_core_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vin_rsc_mgc_in_wire_d(vin_rsc_mgc_in_wire_d),
      .vout_rsc_mgc_out_stdreg_d(vout_rsc_mgc_out_stdreg_d),
      .counter_rsc_mgc_out_stdreg_d(counter_rsc_mgc_out_stdreg_d)
    );
endmodule



