module fillTriangle(
        input logic clk, input logic rst_n,
        input logic [7:0] x1, input logic [6:0] y1,
        input logic [7:0] x2, input logic [6:0] y2,
        input logic start, output logic done,
        output logic [7:0] vga_x, output logic [6:0] vga_y,
        output logic vga_plot
    );

  enum {IDLE, S1, S2, S3, S4, S5, DONE} state = IDLE;

  integer errR, xR, x, y, next_xR; 
  assign vga_plot = state === S1 || (state === IDLE && start); 
  assign done = state === DONE || (state === S1 && x + 1 > xR && errR + 2*(y2-y1) >= 0 && y + 1 > y2);
  assign vga_x = state === S1 ? x : x1;
  assign vga_y = state === S1 ? y : y1;

  always @(posedge clk ) begin
    if (!rst_n) begin
      state <= IDLE;
    end else begin
      case (state)
        IDLE: begin
          if (start) begin
            state <= S1;       
            errR <= (y2-y1) - 2*(x2-x1);
            xR <= x1;
            y <= y1;      
            x <= x1;
            next_xR <= x1; 
            state <= S1; 
            
            if ((y2-y1) - 2*(x2-x1) + 2*(y2-y1) >= 0) begin
              if ($signed((y2-y1) - 2*(x2-x1)) < 0) begin
                errR <= (y2-y1) - 2*(x2-x1) + 2*(y2-y1) - 2*(x2-x1);
                xR <= x1 + 1; 
                next_xR <= x1 + 1;
              end else begin
                errR <= (y2-y1) - 2*(x2-x1) - 2*(x2-x1); 
                xR <= x1; 
              end
              y <= y1 + 1;
              if (y1 + 1 > y2) begin
                state <= DONE;
              end
            end
          end
        end
        S1: begin
          if (x <= xR) begin
            x <= x + 1;
          end
          if (errR < 0) begin
            next_xR <= next_xR + 1;
            errR <= errR + 2*(y2-y1);
          end
          if (x + 1 > xR && errR + 2*(y2-y1) >= 0) begin
            if (errR < 0) begin
              errR <= errR + 2*(y2-y1) - 2*(x2-x1);
              xR = next_xR + 1; 
            end else begin
              errR <= errR - 2*(x2-x1);
              xR = next_xR;
            end
            y <= y + 1;
            x <= x1;
            if (y + 1 > y2) begin
              state <= DONE;
            end
          end
        end
        DONE: begin
          if (~start) begin
            state <= IDLE;
          end
        end
      endcase
    end
  end
endmodule
