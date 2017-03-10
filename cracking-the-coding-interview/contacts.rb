class Node
  attr_reader :value
  attr_accessor :part_of_words

  def initialize(value)
    @value = value
    @part_of_words = 1
    @children = Hash.new()
  end

  # Add a new node for each successive character.
  # If a character is already present and we try to add it again
  # this means that it is used in more than one word.
  def add_child(value)
    node = nil

    if has_child(value)
      node = get_child(value)
      node.part_of_words += 1
    else
      node = Node.new(value)
      @children[value] = node
    end

    return node
  end

  def has_child(value)
    !!@children[value]
  end

  def get_child(value)
    @children[value]
  end
end

class Contacts
  attr_reader :contacts

  def initialize
    @contacts = Hash.new
  end

  def add_name(name)
    first, rest = name[0], name[1..-1]
    @contacts[first] ||= Node.new(first)
    node = @contacts[first]

    rest.each_char do |chr|
      node = node.add_child(chr)
    end
  end

  def find_partial(partial)
    first, rest = partial[0], partial[1..-1]
    match = @contacts[first]

    rest.each_char do |chr|
      break unless match
      match = match.get_child(chr)
    end

    return match ? match.part_of_words : 0
  end
end

my_contacts = Contacts.new
my_contacts.add_name('hack')
my_contacts.add_name('hackerrank')

puts my_contacts.find_partial('hac')
puts my_contacts.find_partial('hak')
