def triangle_divisors(max)

  sum = 1
  n = 2
  divisors = []

  until divisors.size > max
    divisors.clear
    sum += n
    (1..sum).each { |x| divisors << x if sum % x == 0 }
    n += 1
  end
  sum
end

p triangle_divisors(500)