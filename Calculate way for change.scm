(define (num-ways-iter amount) 
  (define (call-when-larger amount coin) (if (> amount coin) (num-ways-iter (- amount coin)) (if (or (= coin 1) (= amount coin)) 1 0)))
  (+ (call-when-larger amount 50) (call-when-larger amount 25) (call-when-larger amount 10) (call-when-larger amount 5) (call-when-larger amount 1))
  )
   ; this takes into account the sequence of giving coins