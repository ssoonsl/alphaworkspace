# Exercise 6: Remove Duplicates from Sorted Array
# returns number of unique elements in Array

# assumptions: array is sorted
# restrictions: constant memory

def remove_duplicates(nums)
  # create new variable int length
  length = 1

  nums.each_with_index do |element, index|
    if nums[index + 1].to_i > nums[index].to_i
      length += 1
    end
  end

  return length

end

p remove_duplicates([1, 2, 3, 3, 3, 4, 5])
