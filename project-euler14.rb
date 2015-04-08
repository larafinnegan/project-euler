def collatz(max)
  hash = {1 => 1}
  num = max

  while num > max / 2
    chain = [num]
    unless hash.has_key?(num)
      n = num
      until n == 1 || hash.has_key?(n)
        n.even? ? n /= 2 : n = (n * 3) + 1
        chain << n
      end
      chain.each_with_index { |x, y| hash[x] = (chain.length - y - 1 + hash[n]) }
    end
    num -= 1
  end
  p hash.max_by {|k, v| v }
end

collatz(1000000)