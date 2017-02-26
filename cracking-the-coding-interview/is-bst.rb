class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
  end
end

def check_bst_min_max(node, min, max)
  return true unless node

  return false if node.value < min || node.value > max

  return check_bst_min_max(node.left, min, node.value - 1) &&
    check_bst_min_max(node.right, node.value + 1, max)
end

def is_bst?(root)
  large_num = 0.size ** 8

  puts check_bst_min_max(root, -large_num, large_num) ? "bst for real" : "not real bst"
end

root = Node.new(4)
root.left = Node.new(2)
root.right = Node.new(5)
root.left.left = Node.new(1)
root.left.right = Node.new(3)

is_bst?(root)
