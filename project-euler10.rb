def prime?(max)
  primes = [2, 3]
  n = 5

  until primes[-1] > max
    unless n % 3 == 0
      square_root = Math.sqrt(n)
      i = primes.index { |x| x >= square_root }
      primes << n if primes[0..i].none? { |x| n % x == 0 }
    end
    n += 2
  end
  p primes[-2..-1]
  primes[0..-2].reduce(:+)
end

p prime?(2000000)