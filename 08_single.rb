# Exercise 8: Single Number II
# Given array of integers, looks for the only element that appears only once

# Best complexity: O(n log n)
# Extra memeory used: 1 integer variable

def single_number(nums)
  # nums must be sorted to proceed
  nums = nums.sort

  # check if it is the smallest element
  if nums[0] != nums[1]
    return nums[0]
  end

  # iterate over array until 2nd last element
  # look for i'th element that is not equal to its neighbors
  i = 1
  n = nums.length - 1

  while i < n do
    if nums[i - 1].to_i != nums[i].to_i && nums[i].to_i != nums[i + 1].to_i
      return nums[i]
    end
    i+=1
  end

  # if element was not found within previous check, it must be the last int
  return nums[nums.length-1]

end

p single_number([1, 2, 3, 4, 1, 2, 3, 1, 2, 3])
