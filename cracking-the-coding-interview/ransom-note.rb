=begin
Given the words in the magazine and the words in the ransom note,
print Yes if he can replicate his ransom note exactly;
otherwise, print No.
=end
def words_are_available?(wanted, given)
    return false if wanted.length > given.length

    word_count = given.reduce(Hash.new(0)) do |acc, word|
      acc[word] += 1
      acc
    end

    puts word_count

    wanted.each do |word|
        return false if word_count[word] == 0
        word_count[word] -= 1
    end

    puts word_count

    return true
end

magazine = "avtq ekpvq z rdvzf m zu bof pfkzl ekpvq pfkzl bof zu ekpvq ekpvq ekpvq ekpvq z".split
ransom = "m z z avtq zu bof pfkzl pfkzl pfkzl rdvzf rdvzf avtq ekpvq rdvzf avtq".split

puts words_are_available?(ransom, magazine) ? "Yes" : "No"
