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

  def has_parent(child_index)
    parent_index(child_index) >= 0
  end

  def has_left_child(parent_index)
    left_child_index(parent_index) < size()
  end

  def has_right_child(parent_index)
    right_child_index(parent_index) < size()
  end

  def parent(child_index)
    has_parent(child_index) ?
      @items[parent_index(child_index)] :
      nil
  end

  def left_child(parent_index)
    has_left_child(parent_index) ?
      @items[left_child_index(parent_index)] :
      nil
  end

  def right_child(parent_index)
    has_right_child(parent_index) ?
      @items[right_child_index(parent_index)] :
      nil
  end

  def swap_at_indexes(from, to)
    @items[from], @items[to] = @items[to], @items[from]
  end
end
