def is_anagram(s, t)
  # return false immediately if lengths differ
  if s.length > t.length || s.length < t.length
    return false
  end

  # convert to array
  s = s.each_char.to_a
  t = t.each_char.to_a

  # sort array
  s.sort!
  t.sort!

  # compare arrays
  if s == t
    true
  else
    false
  end
end

p is_anagram("anagram", "nagaram")
p is_anagram("rat", "car")
p is_anagram("hi", "hello")
p is_anagram("", "")
