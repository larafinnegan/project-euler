require 'set'
require 'benchmark'

# I tried refactoring a bunch of times to see how much I could
# improve performance.  Saving all attempts below for future
# reference.

# original brute force attempt
def triangle_divisors1(max)
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

# realized that all factors of n (besides n itself) must be <= n/2
def triangle_divisors2(max)
  sum = 1
  n = 2
  divisors = []

  until divisors.size > max
    divisors.clear
    sum += n
    (1..(sum/2)).each { |x| divisors << x if sum % x == 0 }
    n += 1
  end
  sum
end

# now using a set rather than an array to avoid duplication
# in the stored factors.
# There's a logic error in the code below though.
# It returns the right answer but it's unnecessarily slow.

def triangle_divisors3(max)
  sum = 1
  n = 2
  divisors = Set.new

  until divisors.size > max
    divisors.clear
    sum += n
    divisor_a = 1
    divisor_b = sum / divisor_a
    while divisor_b >= divisor_a
      divisors += [divisor_a, divisor_b] if sum % divisor_a == 0
      divisor_a += 1
    end
    n += 1
  end
  sum
end

# realized that all 'lower' factors of n must be <= sqrt(n).
# e.g. sqrt(8) = 2.828, and the factors of 8 = 1, 2, 4, 8.
# The 'lower' factors of 1 and 2 are less than 2.828
# Therefore only need to search for factors up to the square root
# and add the corresponding 'upper' factors to the set as we go.

def triangle_divisors4(max)
  sum = 1
  n = 2
  divisors = Set.new

  until divisors.size > max
    divisors.clear
    sum += n
    divisor = 1
    while divisor <= Math.sqrt(sum)
      divisors += [divisor, (sum / divisor)] if sum % divisor == 0
      divisor += 1
    end
    n += 1
  end
  sum
end

# stored the sqrt(sum) in a local variable so it's only calculated
# once for each until loop, rather than once for each interior
# while loop.

def triangle_divisors5(max)
  sum = 1
  n = 2
  divisors = Set.new

  until divisors.size > max
    divisors.clear
    sum += n
    divisor = 1
    square_root = Math.sqrt(sum)
    while divisor <= square_root
      divisors += [divisor, (sum / divisor)] if sum % divisor == 0
      divisor += 1
    end
    n += 1
  end
  sum
end

# this solution looks better (more concise) but it takes about 
# twice as long as the one below it.
# now using #merge rather than += to add factors to the set, 
# which improves performance.

def triangle_divisors6(max)
  sum = 1
  n = 2
  divisors = Set.new

  until divisors.size > max
    divisors.clear
    sum += n
    square_root = Math.sqrt(sum)
    1.upto(square_root) do |x|
      divisors.merge([x, (sum / x)]) if sum % x == 0
    end
    n += 1
  end
  sum
end

# same as the code above but using #while rather than #upto for
# improved processing time.

def triangle_divisors7(max)
  sum = 1
  n = 2
  divisors = Set.new

  until divisors.size > max
    divisors.clear
    sum += n
    divisor = 1
    square_root = Math.sqrt(sum)
    while divisor <= square_root
      divisors.merge([divisor, (sum / divisor)]) if sum % divisor == 0
      divisor += 1
    end
    n += 1
  end
  sum
end

# decided not to store the factors themselves but rather a count
# of the factors.  Realized that any number n has 2 corresponding 
# factors, one greater than sqrt(n) and one less than sqrt(n).  
# If a factor is equal to the square root, it is 
# only counted once.  This shaved off even more processing time.

def triangle_divisors8(max)
  sum = 1
  n = 2
  factors = 0

  until factors > max
    factors = 0
    sum += n
    divisor = 1
    square_root = Math.sqrt(sum)
    while divisor <= square_root
      if sum % divisor == 0
        divisor < square_root ? factors += 2 : factors += 1
      end
      divisor += 1
    end
    n += 1
  end
  sum
end

# below are the run times for each of the 8 methods.
# I'm using a Chromebook so there's not a ton of processing power.

# 1  19.310000   0.010000  19.320000 ( 19.436888)
# 2   9.660000   0.000000   9.660000 (  9.656297)
# 3  15.680000   0.000000  15.680000 ( 15.661333)
# 4   0.620000   0.000000   0.620000 (  0.626592)
# 5   0.350000   0.000000   0.350000 (  0.348422)
# 6   0.200000   0.000000   0.200000 (  0.198549)
# 7   0.130000   0.000000   0.130000 (  0.128517)
# 8   0.050000   0.000000   0.050000 (  0.059492)



#p triangle_divisors1(140)
#p triangle_divisors2(140)
#p triangle_divisors3(140)
#p triangle_divisors4(140)
#p triangle_divisors5(140)
#p triangle_divisors6(140)
#p triangle_divisors7(500)
p triangle_divisors8(500)

#puts Benchmark.measure { triangle_divisors1(140) }
#puts Benchmark.measure { triangle_divisors2(140) }
#puts Benchmark.measure { triangle_divisors3(140) }
#puts Benchmark.measure { triangle_divisors4(140) }
#puts Benchmark.measure { triangle_divisors5(140) }
#puts Benchmark.measure { triangle_divisors6(140) }
#puts Benchmark.measure { triangle_divisors7(500) }
puts Benchmark.measure { triangle_divisors8(500) }
