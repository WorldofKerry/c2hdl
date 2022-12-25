# c2hdl
The idea is simple. Create synthesizable Verilog HDL from C code. 

## Step 1: Blocking to Non-blocking
Combinational logic in Verilog requires non-blocking assignments (otherwise it may not be possible to do the logic on one clock cycle). 
Therefore, given a C code, we must find a way to generate the appropriate sequential logic. 
For example: 
```
a = 10; 
if (a < b) {
    a = a + 1; 
    b = 12; 
    if (a > b) {
        a = a + 14; 
    }
    c = 11; 
}
c = 123; 
```
should convert to: 
```
a <= 10; 
if (10 < b) begin
    a <= 10 + 1;
    b = 12; 
    if (10 + 1 > b) begin
        a <= 10 + 1 + 14; 
    end
    c <= 11; 
}
c <= 123; 
```
currently, the program converts to: 
```
if ( 10 < b ) begin
  if ( 10 + 1 > 12 ) begin
    a <= 10 + 1 + 14
    b <= 12
    c <= 11 + 123
  end else begin
    a <= 10 + 1
    b <= 12
    c <= 11 + 123
  end
end else begin
  if ( 10 > b ) begin
    a <= 10
    b <= b
    c <= 123
  end else begin
    a <= 10
    b <= b
    c <= 123
  end
end
```
which is correct (although a bit inefficient). Yay!

## Step 2: Breaking Down While Loops
