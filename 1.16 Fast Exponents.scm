(define (** bse power) 
  (define (**-iter base power extra)
    (cond 
    ((= power 1) (* base extra))
    ((= (remainder power 2) 0) 
    (**-iter (* base base) (/ power 2) extra))
    (else (**-iter base (- power 1) (* extra base)))
    )
  )
  (**-iter bse power 1)
)