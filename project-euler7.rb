def prime(n)
  primes = [2, 3]
  num = 5
  until primes.length == n
    unless num % 3 == 0
      square_root = Math.sqrt(num)
      max = primes.index { |x| x >= square_root } 
      primes << num if primes[0..max].none? { |prime| num % prime == 0 }
    end
    num += 2
  end
  primes[-1]
end

p prime(10001)
