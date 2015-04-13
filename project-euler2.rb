def questionTwo (limit)

    i = 1
    j = 1
    total = 0
    
    while j <= limit
        sum = i + j
        i = j
        j = sum
        total += sum if sum % 2 == 0
    end
    total
end

p questionTwo (34)
