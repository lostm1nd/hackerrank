=begin
Given two strings, a and , b that may or may not be of the same length,
determine the minimum number of character deletions required to make a and b anagrams.
=end
def convert_to_anagram(first, second)
    first_char = "a"
    char_count = Array.new(26, 0)

    first.each_codepoint { |cp| char_count[cp - first_char.ord] += 1 }
    second.each_codepoint { |cp| char_count[cp - first_char.ord] -= 1 }

    return char_count.map(&:abs).reduce(:+)
end

puts convert_to_anagram("abc", "cde")
puts convert_to_anagram("are", "you")
