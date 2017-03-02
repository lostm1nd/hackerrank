def balanced_brackets?(text)
  brackets = { ")" => "(", "}" => "{", "]" => "[" }
  stack = []

  text.each_char do |ch|
    next stack.push(ch) unless brackets[ch]

    return false if stack.pop != brackets[ch]
  end

  return stack.length == 0
end

puts balanced_brackets?("{[()]}") ? "balanced" : "not_balanced"
puts balanced_brackets?("{[(])}") ? "balanced" : "not_balanced"
puts balanced_brackets?("{{[[(())]]}}") ? "balanced" : "not_balanced"
