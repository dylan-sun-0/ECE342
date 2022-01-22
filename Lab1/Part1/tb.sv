`timescale 1ns/1ns

module tb(); 
logic [7:0] dut_x, dut_y; 
logic [8:0] dut_out; 

RCAgen DUT(.x(dut_x), .y(dut_y), .sum(dut_out)); 

initial begin
	for (integer x = 0; x <256; x++) begin
		for (integer y = 0; y<256; y++) begin 
			logic [8:0] realsum;
			realsum = x + y;
			
			dut_x = x[7:0];
			dut_y = y[7:0];
			#5;
			
			if (dut_out !== realsum) begin 
				$display("Mismatch! %d + %d should be %d, got %d instead", x, y, realsum, dut_out);
				$stop();
			end
		end
	end
	
	$display("Test passed!");
	$stop();
end

endmodule 