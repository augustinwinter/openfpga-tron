`timescale 1ns/1ps

module tb_tron_input_mapper;

reg clk = 0;
always #5 clk = ~clk;

reg [31:0] k1 = 0, k2 = 0;
reg [31:0] j1 = 0, j2 = 0;

wire coin, start1, start2;
wire up, down, left, right;
wire fire, ccw, cw;

tron_input_mapper dut (
    .clk(clk),
    .cont1_key(k1),
    .cont2_key(k2),
    .cont1_joy(j1),
    .cont2_joy(j2),
    .m_coin(coin),
    .m_start1(start1),
    .m_start2(start2),
    .m_up(up),
    .m_down(down),
    .m_left(left),
    .m_right(right),
    .m_fire_a(fire),
    .m_rccw(ccw),
    .m_rcw(cw)
);

task automatic check(
    input [6:0] expected,
    input string label
);
    begin
        repeat (4) @(posedge clk);
        #1;

        if ({cw, ccw, fire, right, left, down, up}
                !== expected) begin
            $display("FAIL: %s", label);
            $display("EXPECTED %07b", expected);
            $display("ACTUAL   %07b",
                {cw, ccw, fire, right, left, down, up});
            $fatal(1);
        end

        $display("PASS: %s", label);
    end
endtask

initial begin
    $display("=== TRON CONTROLLER MAPPER TEST ===");

    // Unplugged slots must not cause ghost movement.
    check(7'b0000000, "Both controller slots empty");

    // Existing handheld D-pad behavior.
    k1 = 32'h10000005;
    check(7'b0000101, "Handheld D-pad up-left");

    k1 = 32'h1000C000;
    check(7'b0000000, "No false movement from start/select");

    if (!coin || !start1 || start2)
        $fatal(1, "Coin/start mapping changed");

    $display("PASS: Coin and start preserved");

    // Player 1 analog.
    k1 = 32'h30000000;
    j1 = 32'h80808080;
    check(7'b0000000, "Analog neutral");

    j1 = 32'h80802020;
    check(7'b0000101, "Left stick up-left diagonal");

    j1 = 32'h8080DCDF;
    check(7'b0001010, "Left stick down-right diagonal");

    j1 = 32'h80808080;
    check(7'b0000000, "Stick centered again");

    // Right stick horizontal.
    j1 = 32'h80F08080;
    check(7'b1000000, "Right stick clockwise");

    j1 = 32'h80208080;
    check(7'b0100000, "Right stick counterclockwise");

    // Shoulder fallback.
    j1 = 32'h80808080;
    k1 = 32'h30000100;
    check(7'b0100000, "L1 counterclockwise");

    k1 = 32'h30000200;
    check(7'b1000000, "R1 clockwise");

    // Fire options.
    k1 = 32'h30000010;
    check(7'b0010000, "A fire");

    k1 = 32'h30000400;
    check(7'b0010000, "L2 fire");

    k1 = 32'h30000800;
    check(7'b0010000, "R2 fire");

    // Simultaneous inputs measured in Pocket logs.
    k1 = 32'h30000010;
    j1 = 32'h80F020E0;
    check(
        7'b1011001,
        "Up-right + clockwise rotation + A fire"
    );

    // Player 2 analog support.
    k1 = 0;
    j1 = 0;
    k2 = 32'h30000800;
    j2 = 32'h8080EDED;
    check(
        7'b0011010,
        "Player 2 diagonal + R2 fire"
    );

    // Unpaired slot 2 must never override player 1.
    k2 = 0;
    j2 = 0;
    k1 = 32'h30000000;
    j1 = 32'h80808080;
    check(7'b0000000, "No ghost input from empty slot 2");

    // Small analog fluctuations remain inside deadzone.
    j1 = 32'h80909090;
    check(7'b0000000, "Analog deadzone");

    $display("RESULT: PASS — ALL CONTROLLER TESTS");
    $finish;
end

endmodule
