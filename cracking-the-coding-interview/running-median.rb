class Heap
  def initialize
    @items = []
  end

  def size
    @items.length
  end

  def add(item)
    @items.push(item)
    heapify_up()
  end

  def peek
    @items[0]
  end

  def poll
    top = @items[0]
    @items[0] = @items.pop
    heapify_down()

    return top
  end

  def to_s
    @items.to_s
  end

  def heapify_up
    puts "not implemented"
  end

  def heapify_down
    puts "not implemented"
  end

  private

  def parent_index(child_index)
    (child_index - 1) / 2
  end

  def left_child_index(parent_index)
    parent_index * 2 + 1
  end

  def right_child_index(parent_index)
    parent_index * 2 + 2
  end

  def parent(child_index)
    @items[parent_index(child_index)]
  end

  def left_child(parent_index)
    @items[left_child_index(parent_index)]
  end

  def right_child(parent_index)
    @items[right_child_index(parent_index)]
  end

  def swap_at_indexes(from, to)
    @items[from], @items[to] = @items[to], @items[from]
  end
end

class MinHeap < Heap
  def heapify_up
    index = @items.length - 1

    while parent_index(index) >= 0 && parent(index) > @items[index]
      swap_at_indexes(parent_index(index), index)
      index = parent_index(index)
    end
  end

  def heapify_down
    index = 0

    while left_child_index(index) < size()
      min_index = left_child_index(index)

      if right_child_index(index) < size() && right_child(index) < left_child(index)
        min_index = right_child_index(index)
      end

      swap_at_indexes(min_index, index)
      index = min_index
    end
  end
end

mh = MinHeap.new
mh.add(3)
mh.add(2)
mh.add(5)
mh.add(1)
puts mh.to_s, mh.peek

mh.add(0)
puts mh.to_s, mh.peek

mh.poll
puts mh.to_s, mh.peek
