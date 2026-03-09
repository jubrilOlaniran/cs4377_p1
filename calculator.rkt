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

  (define (loop i acc)
                    (cons hist-token acc))
              'invalid)]
         [(char-numeric? ch)
          (define end (scan-number j))
          (loop end (cons (substring s j end) acc))]
         [else 'invalid])]))

  (loop 0 '()))

;; History helpers


(define (history-ref history id)
  ;; history is stored newest-first; ids are oldest-first
  (cond
    [(or (< id 1) (> id (length history)))
     (error 'expr "Invalid history reference")]
    [else
     (list-ref (reverse history) (sub1 id))]))


(define (parse-expr tokens history)
  (cond

       [(and (> (string-length tok) 1)
             (char=? (string-ref tok 0) #\$))
        (define id (string->number (substring tok 1)))
        (if (and id (integer? id))
            (list (history-ref history id) (rest tokens))
            (error 'expr "Invalid history reference"))]

       [else
        (define n (string->number tok))
        (if (and n (integer? n))
            (list n (rest tokens))
            (error 'expr "Invalid token"))])]))

(define (evaluate-line line history)
  (define tokens (tokenize line))
  (when (eq? tokens 'invalid)
    (error 'expr "Invalid tokenization"))
  (define result (parse-expr tokens history))
  (define value (first result))
  (define remaining (second result))
  (unless (empty? remaining)
    (error 'expr "Extra input after expression"))
  value)

;; Output helpers


(define (print-result value id)
  (display id)
  (display ": ")
  (displayln (real->double-flonum value)))

(define (print-error)
  (displayln "Error: Invalid Expression"))

(define (print-prompt)
  (when interactive?
    (display "> ")))

;; Main loop


(define (repl history count)
  (print-prompt)
  (define line (read-line))
  (cond
    [(eof-object? line) (void)]
    [(string=? line "quit") (void)]
    [else
     (with-handlers ([exn:fail?
                      (lambda (e)
                        (print-error)
                        (repl history count))])
       (define value (evaluate-line line history))
       (print-result value count)
       (repl (cons value history) (add1 count)))])

(repl '() 1)
