#lang racket
(require "mode.rkt")

;; Prefix calculator with history.
;; Runs in interactive mode when prompt? is true.
;; Runs in batch mode when prompt? is false.
;; Tokenizing


(define (tokenize s)
