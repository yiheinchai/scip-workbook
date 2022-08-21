(define (** bse ex) 
  (define (iter bse prev count)
    (cond 
      ((= count ex) (* bse prev))
      (else (iter bse (* bse prev) (+ count 1)))
    )
  )
  (iter bse bse 2)
)