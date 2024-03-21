/*
ALU module, which takes two operands of size 32-bits each and a 4-bit ALU_control as input.
Operation is performed on the basis of ALU_control value and output is 32-bit ALU_result. 
If the ALU_result is zero, a ZERO FLAG is set.
*/

/*
ALU Control lines | Function
-----------------------------
        0000    Bitwise-AND
        0001    Bitwise-OR
        0010	Add (A+B)
        0100	Subtract (A-B)
        1000	Set on less than
        0011    Shift left logical
        0101    Shift right logical
        0110    Multiply
        0111    Bitwise-XOR
*/

module ALU (
    input [31:0] in1,in2, 
  input[2:0] alu_control,
    output reg [31:0] alu_result,
    output reg zero_flag
);
    always @(*)
    begin
        // Operating based on control input
        case(alu_control)

       
        3'b000: alu_result = in1+in2;
        3'b001:begin
          if(in1>in2)
          alu_result = in1-in2;
          else
             alu_result = in2-in1;
          end
        3'b010: alu_result = in1&in2;
        3'b011: alu_result = in1|in2;
        3'b101: begin 
            if(in1<in2)
            alu_result = 1;
            else
            alu_result = 0;
        end

          3'b100: alu_result = in1^in2;
          
        endcase

        // Setting Zero_flag if ALU_result is zero
        if (alu_result == 0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;
        
    end
endmodule