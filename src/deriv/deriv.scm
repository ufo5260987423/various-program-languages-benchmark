(import (rnrs))

(define (deriv a)
  (if (not (pair? a))
    (if (eq? a 'x) 1 0)
    (case (car a)
      ['+ `(+ ,@(map deriv (cdr a)))]
      ['- `(- ,@(map deriv (cdr a)))]
      ['* `(* ,a (+ ,@(map (lambda (a) '(/ ,(deriv a) ,a)) (cdr a))))]
      ['/ `(- (/ ,(deriv (cadr a)) ,(caddr a)) (/ ,(caddr a) (* ,(caddr a) ,(caddr a) ,(deriv (caddr a))))) ]
      [else (error #f "No derivation method available")])))

(deriv '(+ (* (* 3 x x) (+ (/ 0 3) (/ 1 x) (/ 1 x)))
  (* (* a x x) (+ (/ 0 a) (/ 1 x) (/ 1 x)))
  (* (* b x) (+ (/ 0 b) (/ 1 x)))
  0))