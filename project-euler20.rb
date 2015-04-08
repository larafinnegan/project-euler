def factorial(n)

	(1..n).reduce(1, :*).to_s.split("").inject { |sum, n| sum.to_i + n.to_i }

end

p factorial(100)