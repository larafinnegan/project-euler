def questionTwo (limit)

    i=1
    j=1
    total=0
    
    while j <= limit
        sum = i + j
        i=j
        j=sum
        if sum % 2 == 0
            total += sum
        end
    end
    puts total
end

questionTwo (34)