module CONTROL(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
  output reg [2:0] alu_control,
    output reg regwrite_control
);
    always @(funct3 or funct7 or opcode)
    begin
        if (opcode == 7'b0110011) begin // R-type instructions

            regwrite_control = 1;

            case (funct3)
                0: begin
                    if(funct7 == 0)
                    alu_control = 3'b000; // ADD
                    else if(funct7 == 32)
                    alu_control = 3'b001; // SUB
                end
                6: alu_control = 3'b010; // OR
                7: alu_control = 3'b011; // AND
				4: alu_control = 3'b100; // XOR
              2:alu_control=3'b101;//comp
              //default:alu_control=
            endcase

      end

    end

endmodule