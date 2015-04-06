def smallest_multiple(n)
	answer = n
	divisor = n
	
	until divisor == 1 
		if answer % divisor == 0
			divisor -= 1
		else
			divisor = n
			answer += n
		end
	end
	answer
end

p smallest_multiple(20)

