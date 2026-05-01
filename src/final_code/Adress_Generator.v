`timescale 1ns/1ps

module Adress_Generator (
    input             rst,
    input             clk,
    input             PCSrcE,
    input             StallF,
    input      [31:0] PCPlus4F,
    input      [31:0] PCTargetE,
    output reg [31:0] PCF
);

    reg [31:0] PCFbar;

    always @(*) begin
        PCFbar = PCSrcE ? PCTargetE : PCPlus4F;
    end

    always @(posedge clk) begin
        if (rst)
            PCF <= 32'd0;
        else if (StallF)
            PCF <= PCF;
        else
            PCF <= PCFbar;
    end

endmodule
