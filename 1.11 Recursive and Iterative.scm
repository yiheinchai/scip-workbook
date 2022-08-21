(define (f n) (if (< n 3) n (+ (f (- n 1)) (* 2(f (- n 2))) (* 3 (f (- n 3))))))

; find f(n) given f(n-1), f(n-2), f(n-3)
(define (fn fn-1 fn-2 fn-3) 
  (+ fn-1 (* 2 fn-2) (* 3 fn-3))
)

; find f(3)
(fn 2 1 0)

; find f(4)
(fn (fn 2 1 0) 2 1)

; find f(n)
; to find f(n) we must first start from f(3) and iterate our way to f(n) meanwhile storing the past 3 results at each iteration
; when we finally reach f(n) we used the stored f(n-1), f(n-2), f(n-3) result to find f(n)

(define (f n)
  (define (fn fn-1 fn-2 fn-3) 
    (+ fn-1 (* 2 fn-2) (* 3 fn-3))
  )
  (define (iter curr final fn-1 fn-2 fn-3)
    (if (= curr final) (fn fn-1 fn-2 fn-3)
      (iter (+ curr 1) final (fn fn-1 fn-2 fn-3) fn-1 fn-2)
    )
  )
  (iter 3 n 2 1 0)
)

(f 10)
