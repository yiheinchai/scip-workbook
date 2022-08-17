(define (square-sum-larger a b c)
  	(define (square x) (* x x))
  	(define (sum f x y) (+ (f x) (f y)))
	(cond 
		(
			(and (> a c) (> b c)) (sum square a b)
		)
     	(
			(and (> b a) (> c a)) (sum square c b)
		)
		(
			else (sum square a c)
		)
	)
  )