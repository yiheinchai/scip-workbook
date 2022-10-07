; The question specifies a generic transformation to find the next value of the fibonacci sequence
; We have found that applying the generic transformation twice is the same as applying the transformation with 'upgraded' p q values just once.

; When we upgrade the pq-value, the number of transformations required to get the answer halves.
; For example, pq-values(lvl 1) require 8 transformations to reach fib(n=8), as each transformation increments n by 1
; For example, pq-values(lvl 2) require 4 transformations to reach fib(n=8), as each transformation increments n by 2
; For example, pq-values(lvl 3) require 2 transformations to reach fib(n=8), as each transformation increments n by 4
; For example, pq-values(lvl 4) require 1 transformation to reach fib(n=8), as each transformation increments n by 8

; It is important to note that the number of transformations left is in reference to the number of transformation of the current version of the pq-value.
; When we say we only require 2 transformations to reach fib(n=8), we mean we require 2 transformations using pq-value(3) to reach fib(n=8).

; For example to calculate fib(n=25), we can go by the following steps
; We start with pq-values(lvl 1), which increments n by 1.
; Apply pq-values(lvl 1) transformation once, resulting in fib(n=1). We still require another 24 transformations using pq-values(lvl 1) to reach fib(n=25)
; Upgrade pq-values(lvl 1) to pq-values(lvl 2). No change in fib values, we are still at fib(n=1). We still require another 12 transformations using pq-values (lvl 2) to reach fib(n=25).
; Upgrade pq-values(lvl 2) to pq-values(lvl 3). No change in fib values, we are still at fib(n=2). We still require another 6 transformations using pq-values (lvl 3)
; Upgrade pq-values(lvl 3) to pq-values(lvl 4). No change in fib values, we are still at fib(n=2). We still require another 3 transformations using pq-values (lvl 4)
; Apply pq-values(lvl 4) transformation once, resulting in fib(n = 1 + 8) = fib(n=9). We still require another 2 transformations using pq-values(lvl 4).
; Upgrade pq-values(lvl 4) to pq-values(lvl 5). No change in fib values, we are still at fib(n=9). We still require another 1 transformations using pq-values (lvl 5)
; Apply pq-values(lvl 5) transformation once, resulting in fib(9 + 16) = fib(25), we have successfully attain fib(n=25).

; It is important to note that to find fib(n=25), we only applied the transformation 3 times, which is sooooo much better than applying it 25 times using pq-values(lvl 1)!
; We spent the rest of our time upgrading the pq-values such that we need to do fewer transformations in the future.

; SOURCE CODE

 (define (fib n) 
   (fib-iter 1 0 0 1 n)) 
 (define (fib-iter a b p q count) 
   (cond ((= count 0) b) 
         ((even? count) 
          (fib-iter a 
                    b 
                    (+ (square p) (square q)) 
                    (+ (* 2 p q) (square q)) 
                    (/ count 2))) 
         (else (fib-iter (+ (* b q) (* a q) (* a p)) 
                         (+ (* b p) (* a q)) 
                         p 
                         q 
                         (- count 1))))) 
  
 (define (square x) (* x x)) 