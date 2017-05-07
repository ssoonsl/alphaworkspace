# Exercise 10: Search Insert Position
# Searches for index (or designated index) of target

def search_insert(nums, target)

  # iterate over array until target's position is found
  (0..nums.length-1).each do |i|
    if nums[i] >= target
      return i
    end
  end

  # if target is bigger than all elements in array, target belongs at the end
  return nums.length

end

p search_insert([1,3,5,6], 5) # 2
p search_insert([1,3,5,6], 2) # 1
p search_insert([1,3,5,6], 7) # 4
p search_insert([1,3,5,6], 0) # 0
