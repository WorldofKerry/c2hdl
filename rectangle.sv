module plot_state_machine (
input wire x1,
input wire y1,
input wire x2,
input wire y2,
output wire plot
);

reg [31:0] x;
reg [31:0] y;

parameter state_outer_loop = 0;
parameter state_inner_loop = 1;

reg [1:0] current_state;

always @(*) begin
case (current_state)
state_outer_loop: begin
x = x + 1;
if (x > x2) begin
current_state = state_inner_loop;
end
end
state_inner_loop: begin
y = y + 1;
if (y > y2) begin
current_state = state_outer_loop;
end
end
endcase
end

assign plot = (current_state == state_inner_loop);

endmodule