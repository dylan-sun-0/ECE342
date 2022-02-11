`timescale 1ns/1ns
`define DELAY 100

module tb();
	reg [31:0] multiplicand;
	reg [31:0] multiplier;
	
	reg [31:0] product;
	reg zero , underflow , overflow , nan;
	
	float_mult mult(
		.x(multiplicand),
		.y(multiplier),
		.result(product),
		.zero(zero) , .underflow(underflow) , .overflow(overflow) , .nan(nan)
	);

	initial begin
		multiplicand = 32'b10000001100100000000000000000000;
		multiplier =   32'b00000001000110000000000000000000;
		#(`DELAY);
		//zero
		multiplicand = 32'b00000000000000000000000000000000;
		multiplier =   32'b01000001000110000000000000000000;
		#(`DELAY);
		//overflow
		multiplicand = 32'b11111001100100000000000000000000;
		multiplier =   32'b01111111000110000000000000000000;
		#(`DELAY);
		//underflow
		multiplicand = 32'b10000000100100000000000000000000;
		multiplier =   32'b00000000100110000000000000000000;
		#(`DELAY);
	end
endmodule