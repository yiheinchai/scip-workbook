(define (mul a b)
  (cond 
    ((= b 0) 0)
    ((= (remainder b 2) 0) (mul (* a 2) (/ b 2)))
    (else (+ a (mul a (- b 1))))
  )
)