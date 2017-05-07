# Exercise 2

def contains_duplicate(nums)
  no_dupe = nums.uniq

  if nums.length > no_dupe.length
    puts "true"
  else
    puts "false"
  end

end

contains_duplicate([1, 2, 3])
contains_duplicate([])
