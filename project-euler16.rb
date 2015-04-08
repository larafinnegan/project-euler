def power_digit_sum(num, power)

	(num ** power).to_s.split("").inject { |sum, n| sum.to_i + n.to_i }

end


p power_digit_sum(2, 1000)