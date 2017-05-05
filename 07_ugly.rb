# Exercise 7: Ugly number
# finds out of a number is "ugly"

require "prime"

def is_ugly(num)
  # immediately return false if num is negative or 0
  if num < 1
    return false
  end

  # immediately return true if num is 1, 2, 3, 4, 5
  if num <= 5
    return true
  end

  # iterate over Prime class
  # test if each prime number (up to num) is a prime factor of num
  # returns false if prime factor > 5 found
  Prime.each(num) do |prime|
    if num % prime == 0
      if prime > 5
        return false
      end
    end
  end

  # if all prime factors are <= 5, the number is ugly
  return true

end

p is_ugly(6)
p is_ugly(8)
p is_ugly(14)
p is_ugly(0)
p is_ugly(-1)
