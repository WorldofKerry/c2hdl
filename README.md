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
if ( __root__ ) begin
  if ( 10 < b ) begin
    if ( 10 + 1 > b ) begin
      a <= 10 + 1 + 14
    end else begin
      a <= 10 + 1
    end
  end else begin
    if ( 10 + 1 > b ) begin
      a <= 10 + 14
    end else begin
      a <= 10
    end
  end
end else begin
  if ( 10 < b ) begin
    if ( 10 + 1 > b ) begin
      a <= a + 1 + 14
    end else begin
      a <= a + 1
    end
  end else begin
    if ( 10 + 1 > b ) begin
      a <= a + 14
    end else begin
      a <= a
    end
  end
end
if ( a < b ) begin
  b <= 12
end else begin
  b <= b
end
if ( a < b ) begin
  if ( __root__ ) begin
    c <= 11 + 123
  end else begin
    c <= 11
  end
end else begin
  if ( __root__ ) begin
    c <= 123
  end else begin
    c <= c
  end
end
```
which is not correct, as the blocks of code are do not correctly replace the conditions with the updated values. 

## Step 2: Breaking Down While Loops
