# frozen_string_literal: true

def fizz_buzz(n)
  ret = ''
  ret += 'Fizz' if (n % 3).zero?
  ret += 'Buzz' if (n % 5).zero?
  ret = n.to_s if ret == ""
  ret
end
