# Development Log
## 2026-03-08 8:45 PM
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

## 2026-03-08 11:35 PM

### Thoughts so far
I finished implementing the main calculator logic, including the tokenizer, recursive parsing of prefix expressions, evaluation of the operators (+, *, /), unary negation, and history lookup using the $n syntax. The program now keeps a history of results and prints them with the correct history id.

While testing the program I noticed that there was a small issue with how the mode detection was behaving. The program was not always switching correctly between interactive and batch mode. After investigating the issue, I realized that the mode file needed a small adjustment so that it properly exports the prompt flag and works correctly when required by the calculator file.

### What I accomplished this session
During this session I:
- completed the implementation of the calculator logic
- implemented prefix expression parsing and evaluation
- added history tracking and lookup
- tested several expressions to verify correct behavior
- identified and fixed a small issue in the mode detection file

The calculator now evaluates expressions correctly and prints results with their history id. It also handles invalid expressions by printing an error message.

### Next steps
My next step is to finish writing the README file that explains the files in the repository and how to run the program from the command line. After that I will do a final check of the repository to make sure the working tree is clean and then zip the repository for submission.
