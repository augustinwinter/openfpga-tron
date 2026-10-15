// TRON T03-A2.8N
// Pocket raw analog + digital controller translation.
// Analog is accepted only from controller type 3.
// Discrete eight-way movement; spinner and arcade logic unchanged.

module tron_input_mapper (
    input wire clk,
    input wire [31:0] cont1_key,
    input wire [31:0] cont2_key,
    input wire [31:0] cont1_joy,
    input wire [31:0] cont2_joy,

    output wire m_coin,
    output wire m_start1,
    output wire m_start2,
    output wire m_up,
    output wire m_down,
    output wire m_left,
    output wire m_right,
    output wire m_fire_a,
    output wire m_rccw,
    output wire m_rcw
);

// Nominal analog center: 0x80.
// Deadzone: approximately +/- 32 units.
localparam [7:0] LOW  = 8'd96;
localparam [7:0] HIGH = 8'd160;

// An absent controller reports zero analog words.
// Never treat those zeroes as stick deflection.
wire analog1 = cont1_key[31:28] == 4'h3;
wire analog2 = cont2_key[31:28] == 4'h3;

wire [7:0] lx1 = cont1_joy[7:0];
wire [7:0] ly1 = cont1_joy[15:8];
wire [7:0] rx1 = cont1_joy[23:16];

wire [7:0] lx2 = cont2_joy[7:0];
wire [7:0] ly2 = cont2_joy[15:8];
wire [7:0] rx2 = cont2_joy[23:16];

// Y-low = up, X-low = left.
// All four diagonal combinations are representable.
wire raw_up =
    cont1_key[0] | cont2_key[0] |
    (analog1 && ly1 < LOW) |
    (analog2 && ly2 < LOW);

wire raw_down =
    cont1_key[1] | cont2_key[1] |
    (analog1 && ly1 > HIGH) |
    (analog2 && ly2 > HIGH);

wire raw_left =
    cont1_key[2] | cont2_key[2] |
    (analog1 && lx1 < LOW) |
    (analog2 && lx2 < LOW);

wire raw_right =
    cont1_key[3] | cont2_key[3] |
    (analog1 && lx1 > HIGH) |
    (analog2 && lx2 > HIGH);

// A, L2, R2 = fire.
wire raw_fire =
    cont1_key[4] | cont2_key[4] |
    cont1_key[10] | cont2_key[10] |
    cont1_key[11] | cont2_key[11];

// L1/R1 remain rotary controls.
// Right-stick horizontal provides alternate rotation.
wire raw_rccw =
    cont1_key[8] | cont2_key[8] |
    (analog1 && rx1 < LOW) |
    (analog2 && rx2 < LOW);

wire raw_rcw =
    cont1_key[9] | cont2_key[9] |
    (analog1 && rx1 > HIGH) |
    (analog2 && rx2 > HIGH);

// Synchronize decoded control levels into the
// game clock domain before feeding MCR2/spinner.
reg [6:0] stage1 = 7'b0;
reg [6:0] stage2 = 7'b0;

always @(posedge clk) begin
    stage1 <= {
        raw_rcw, raw_rccw, raw_fire,
        raw_right, raw_left, raw_down, raw_up
    };
    stage2 <= stage1;
end

assign {
    m_rcw, m_rccw, m_fire_a,
    m_right, m_left, m_down, m_up
} = stage2;

// Preserve existing coin/start behavior.
assign m_coin   = cont1_key[14] | cont2_key[14];
assign m_start1 = cont1_key[15];
assign m_start2 = cont2_key[15];

endmodule
