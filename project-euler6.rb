require 'benchmark'

def sumsquares(n, sum = 0)
  return sum if n == 0
  sumsquares(n - 1, sum += (n ** 2))
end

def squaresum(n)
  ((1..n).reduce(:+)) ** 2
end

p squaresum(1000) - sumsquares(1000)