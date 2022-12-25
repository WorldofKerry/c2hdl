# c2hdl
The idea is simple. Create synthesizable Verilog HDL from C code. 

## How to use: 
Take your C code with no function declarates. Paste it into ChatGPT with prompt 'Rewrite this C code using a single `while(true)` and if statements. If there is an `if (condition) { ... } else { ... }` statement, replace it with `if (condition) { ... } if (!condition) { ... }`'. Paste the output to the source.c file. Run all of `main.ipynb`. 

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
    c = b + 11; 
}
c = c + 5; 
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
    c <= b + 11; 
end
c <= c + 5; 
```
currently, the program converts to: 
```
if ( 10 < b ) begin
  if ( 10 + 1 > 12 ) begin
    a <= 10 + 1 + 14
    b <= 12
    c <= 12 + 11 + 5
  end else begin
    a <= 10 + 1
    b <= 12
    c <= 12 + 11 + 5
  end
end else begin
  if ( 10 > b ) begin
    a <= 10
    b <= b
    c <= c + 5
  end else begin
    a <= 10
    b <= b
    c <= c + 5
  end
end
```
which is correct (although a bit inefficient). Yay!

## Step 2: Breaking Down While Loops
