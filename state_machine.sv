module state_machine (
  input wire rst,
  input wire clk,
  input wire start,
  output wire done
);
  reg [2:0] state;
  always @(posedge clk) begin
    if (rst) begin
      state <= 0;
    end else begin
      case (state)
        {'{:0{}b}'.format(i, num_states)}: begin
          if (start) begin
            state <= 1;
          end
        end
        {'{:0{}b}'.format(i, num_states)}: begin
          state <= 2;
        end
        {'{:0{}b}'.format(i, num_states)}: begin
          state <= 0;
        end
      endcase
    end
  end
  assign done = (state == 2);
endmodule