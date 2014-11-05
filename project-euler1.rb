def questionOne (limit)
    
    sum=0
    while limit > 1
        if (limit % 3 == 0) || (limit % 5 == 0)
            sum += limit
        end
        limit -= 1
    end
    puts sum
end


questionOne (10)