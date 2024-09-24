;;; FIB -- A classic benchmark, computes fib(n) inefficiently.

(import (rnrs))

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

(fib 40)