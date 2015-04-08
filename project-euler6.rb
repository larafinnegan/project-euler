def sumsquares(n, sum = 0)
  return sum if n == 0
  sumsquares( n-1, sum += (n ** 2))
end

def squaresum(n)
  sum = 0
  1.upto(n) { |i| sum += i }
  sum ** 2
end


p squaresum(100) - sumsquares(100)