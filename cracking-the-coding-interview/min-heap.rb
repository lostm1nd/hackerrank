require './heap'

class MinHeap < Heap
  def heapify_up
    index = @items.length - 1

    while has_parent(index) && parent(index) > @items[index]
      swap_at_indexes(parent_index(index), index)
      index = parent_index(index)
    end
  end

  def heapify_down
    index = 0

    while has_left_child(index)
      min_index = left_child_index(index)

      if has_right_child(index) && right_child(index) < left_child(index)
        min_index = right_child_index(index)
      end

      break if @items[min_index] >= @items[index]

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
