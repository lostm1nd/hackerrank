class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
  end
end

def has_cycle?(head)
  return false unless head

  tortoise = head
  hare = head.next

  while hare && hare.next
    return true if tortoise == hare

    tortoise = tortoise.next
    hare = hare.next.next
  end

  return false
end

head = Node.new(2)
head.next = Node.new(0)

link = Node.new(6)
link.next = Node.new(3)

cycle = Node.new(1)

head.next.next = link
link.next.next = cycle
cycle.next = link

puts "Cycling is my hobby" if has_cycle?(head)
