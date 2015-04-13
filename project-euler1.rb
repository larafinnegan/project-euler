def questionOne (limit)
    
    sum=0
    (1...limit).each { |x| sum += x if (x % 3 == 0) || (x % 5 == 0) }
    sum
end


p questionOne (10)
