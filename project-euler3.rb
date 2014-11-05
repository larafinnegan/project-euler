def questionThree (limit)

    denominator = 2

    while limit >= denominator
        while limit % denominator == 0
            limit /= denominator
        end
        denominator += 1
    end
    puts denominator-1
end        

questionThree (29)    
questionThree (2)
questionThree (3)
questionThree (4)
questionThree (5)
questionThree (6)
questionThree (7)
questionThree (8)
questionThree (9)
questionThree (10)
questionThree (11)
questionThree (12)