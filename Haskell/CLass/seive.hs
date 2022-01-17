primes = seive [2..]
 where
     seive (x:xs) = x:([p |p<-seive xs, (p `mod` x) /= 0 ])