(define (num-ways-iter amount) 
  (define (call-when-larger amount coin) 
    (if (> amount coin) 
        (num-ways-iter (- amount coin)) 
        (if (or (= coin 1) (= amount coin)) 1 0)))
  (+ 
    (call-when-larger amount 50) 
    (call-when-larger amount 25) 
    (call-when-larger amount 10) 
    (call-when-larger amount 5) 
    (call-when-larger amount 1))
  )
   ; this takes into account the sequence of giving coins



(define (count-change amount)
  (define (count-iter amount kinds-of-coins) 
    (define (get-first-coin kinds) (cond 
      ((= kinds 5) 50 )
      ((= kinds 4) 25 )
      ((= kinds 3) 10 )
      ((= kinds 2) 5  )
      ((= kinds 1) 1  )))
    (define (continue-iter)
      (+ (count-iter amount ( - kinds-of-coins 1)) (count-iter ( - amount (get-first-coin kinds-of-coins)) kinds-of-coins))
    )
    (cond 
      ((= amount 0) 1) 
      ((< amount 0) 0) 
      ((= kinds-of-coins 0) 0) 
      (else (continue-iter)))
    )
  (count-iter amount 5)
)

