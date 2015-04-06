def largest_palindrome_product(n)
	max_divisor = ("9" * n).to_i
	max = max_divisor ** 2
	min_divisor = ("1" + ("0" * (n - 1))).to_i
	remainder = 1

	while max > min_divisor ** 2
		if is_palindrome?(max.to_s)
			divisor_a = min_divisor
			until divisor_a == max_divisor
				remainder = max % divisor_a
				divisor_b = max / divisor_a
				return max if remainder == 0 && divisor_b.between?(min_divisor, max_divisor)
	    		divisor_a += 1
	    	end
		end
		max -= 1
	end
end

def is_palindrome?(n)
	return true if n.size <= 1
	n[0] == n[-1] ? is_palindrome?(n[1..-2]) : (return false)
end 

p largest_palindrome_product(3)