module sev_seg_top(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,   
    input wire BTNC,
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire [15:0] SW     
);


logic reset_n;
logic clk;

assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;


// Seven segments Controller
wire [6:0] Seg;
wire [3:0] digits[0:7];

localparam N = 9;
localparam WIDTH = $clog2(N);
logic [WIDTH-1:0] prog_count;

localparam DATA_WIDTH = 8;
logic [DATA_WIDTH-1:0] RA, RB, RO;
//logic [7:0] RA, RB, RO;

// CLOCK DIVIDER
    
    logic clk_div;
    
    clock_divider #(.N(50000000)) clk_div_inst (
            .clk(clk),
            .areset(reset_n),
            .clk_out(clk_div)
            );

microprocessor_v1 microprocessor_inst (
        .clk(clk_div),
        .reset_n(CPU_RESETN),
        .en(SW[0]),
        .prog_count(prog_count),
        .A(RA),
        .B(RB),
        .Out(RO)
    );

assign digits[0] = prog_count[3:0];
assign digits[1] = 4'b1111;
assign digits[2] = RA[3:0];
assign digits[3] = RA[7:4];
assign digits[4] = RB[3:0];
assign digits[5] = RB[7:4];
assign digits[6] = RO[3:0];
assign digits[7] = RO[7:4];


sev_seg_controller ssc(
    .clk(clk),
    .resetn(reset_n),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);


assign CA = Seg[0];
assign CB = Seg[1];
assign CC = Seg[2];
assign CD = Seg[3];
assign CE = Seg[4];
assign CF = Seg[5];
assign CG = Seg[6];
assign DP = 1'b1; // turn off the dot point on seven segs


endmodule : sev_seg_top
