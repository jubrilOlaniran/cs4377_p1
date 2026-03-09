#lang racket
(require "mode.rkt")

;; Prefix calculator with history.
;; Runs in interactive mode when prompt? is true.
;; Runs in batch mode when prompt? is false.
;; Tokenizing


(define (tokenize s)
  (define len (string-length s))

  (define (skip-space i)
    (cond
      [(>= i len) i]
      [(char-whitespace? (string-ref s i)) (skip-space (add1 i))]
      [else i]))

  (define (scan-number i)
    (define (loop j)
      (cond
        [(>= j len) j]
        [(char-numeric? (string-ref s j)) (loop (add1 j))]
        [else j]))
    (loop i))

  (define (scan-history i)
    (define start (add1 i))
    (define end (scan-number start))
    (if (= start end)
        #f
        (substring s i end)))

