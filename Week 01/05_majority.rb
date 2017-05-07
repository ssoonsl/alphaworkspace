# Exercise 5: Majority element
# Finds element with largest frequency of occurence in an array

# assumptions: array is non-empty and majority element always exists

def majority_element(nums)
  # populate hash with frequency of each int in nums[]
  count = Hash.new(0)
  nums.each { |i|
    count[i] += 1
  }

  # find majority element by highest v
  majority_arr = count.max_by{ |k,v| v}

  # check that it is >= n/2
  # might be optional due to assumption in exercise specs?
  if majority_arr[0] >= ((nums.length / 2) % 1)
    return majority_arr[0]
  else
    return "wrong majority"
  end

end

p majority_element([1, 1, 1, 1, 4, 3, 5])
