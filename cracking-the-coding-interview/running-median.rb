require "./min-heap"
require "./max-heap"

def running_median(numbers)
  lower_half = MaxHeap.new
  higher_half = MinHeap.new

  numbers.each do |num|
    add_to_heap(num, lower_half, higher_half)
    rebalance_heaps(lower_half, higher_half)
    puts get_median(lower_half, higher_half)
  end
end

def add_to_heap(number, low, high)
  if low.size == 0 || low.peek > number
    low.add(number)
  else
    high.add(number)
  end
end

def rebalance_heaps(low, high)
  return unless (low.size - high.size).abs > 1

  low.size > high.size ? high.add(low.poll) : low.add(high.poll)

  rebalance_heaps(low, high)
end

def get_median(low, high)
  if low.size > high.size
    low.peek
  elsif high.size > low.size
    high.peek
  else
    (low.peek + high.peek).to_f / 2
  end
end

running_median([12, 4, 5, 3, 8, 7])
