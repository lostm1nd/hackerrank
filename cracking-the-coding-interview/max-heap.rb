require './heap'

class MaxHeap < Heap
  def heapify_up
    index = @items.length - 1

    while has_parent(index) && parent(index) < @items[index]
      swap_at_indexes(parent_index(index), index)
      index = parent_index(index)
    end
  end

  def heapify_down
    index = 0

    while has_left_child(index)
      max_index = left_child_index(index)

      if has_right_child(index) && right_child(index) > left_child(index)
        max_index = right_child_index(index)
      end

      break if @items[max_index] <= @items[index]

      swap_at_indexes(max_index, index)
      index = max_index
    end
  end
end

mh = MaxHeap.new
mh.add(3)
mh.add(2)
mh.add(5)
mh.add(1)
puts mh.to_s, mh.peek

mh.add(10)
puts mh.to_s, mh.peek

mh.poll
puts mh.to_s, mh.peek

mh.poll
puts mh.to_s, mh.peek
