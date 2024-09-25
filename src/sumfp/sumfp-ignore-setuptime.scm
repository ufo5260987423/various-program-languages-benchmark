;;; SUMFP -- Compute sum of integers from 0 to n using floating point

(import (rnrs))

(define (run n)
  (let loop ((i n) (sum 0.))
    (if (< i 0.)
        sum
        (loop (- i 1.) (+ i sum)))))

(let loop ([i 0])
  (run 8000)
  (if (< i 10000)
    (loop (+ 1 i))))