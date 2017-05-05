def is_power_of_two(n)
  if n < 0
    return false
  end
  if Math.log2(n) % 1 == 0
    true
  else
    false
  end
end

p is_power_of_two(8)
