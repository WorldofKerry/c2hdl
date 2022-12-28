# c2hdl
The idea is simple. Create synthesizable Verilog HDL from C code. 

## How to use: 
Take your C code with no function declarates. Paste it into ChatGPT with prompt 'Rewrite this C code using a single `while(true)` and if statements. If there is an `if (condition) { ... } else { ... }` statement, replace it with `if (condition) { ... } if (!condition) { ... }`'. Paste the output to the source.c file. Run all of `main.ipynb`. 

## Future Features
- Expand more on the statefulness of the code
- More concrete code parse, less reliance on having correctly formatted C code

## Version 3: 
- Too much overhead in parsing the code myself, will use a library instead
- Focus more on the correctness of the output of the non-blocking assignments

## Version 2: 
- check if a variable is present in any conditional statement, if it is not, then it can be used as combinational logic
- Support for multiple while loops and states

## Version 1: 
- more streamlined approach in converting C code to a decision tree for non-blocking assignment

## Version 0: 
- Messing with ASTs, learning regurgitate the C code. 