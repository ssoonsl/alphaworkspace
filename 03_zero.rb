# Exercise 3: Move zeroes
# Moves all zeroes in an array to the end

# Restrictions: operations must be done in-place

def move_zeroes(nums)
  zeroes = nums.count(0)
  nums.delete(0)

  zeroes.times do
    nums.push(0)
  end

  puts nums.inspect
end

move_zeroes([0, 1, 0, 3, 12])
