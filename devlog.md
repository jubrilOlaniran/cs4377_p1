# Development Log
## 2026-03-08 9 PM
### Thoughts so far
This project is a prefix-notation calculator in Racket. It needs to support integers, binary +, binary *, binary /, unary -, and history references like $1. It also needs to work in interactive mode and batch mode. Don't have a lot of time becuase personal things but going to try to do the best i can.
### Plan for this session
- Set up the git repository
- Add the project files
- Implement the calculator
- Test the required expressions
- Write the README


# Development Log

## 2026-03-08 9:17 PM
### Thoughts so far
I have the repository set up with the required files: calculator.rkt, mode.rkt, devlog.md, and README.md. I understand that the program needs to evaluate prefix expressions, keep a history of results, support batch mode and interactive mode, and print a generic error message for invalid expressions.

### Plan for this session
My goal is to just get almost complete working version of the calculator done in the next coupel hours. I want to:
- set up `mode.rkt` correctly so the program can switch between interactive mode and batch mode
- write the tokenizer so it can read operators, integers, and history references like `$1`
- write a recursive parser/evaluator that returns both the computed value and the remaining tokens
