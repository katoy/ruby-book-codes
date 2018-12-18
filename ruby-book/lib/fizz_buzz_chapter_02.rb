def fizz_buzz(n)
  ret = ''
  ret += 'Fizz' if (n % 3).zero?
  ret += 'Buzz' if (n % 5).zero?
  ret = n.to_s if ret == ""
  ret
end

def sample_run
  [1, 2, 3, 4, 5, 15].each do |x|
    puts "fizz_buzz(#{x}): #{fizz_buzz(x)}"
  end
end

if __FILE__ == $0
  sample_run
end
