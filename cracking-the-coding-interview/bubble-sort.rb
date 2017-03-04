def bubble_sort(array, opt = { reverse: false })
  is_sorted = true

  for i in 0...array.length do
    next if i == 0

    if array[i-1] < array[i] == opt[:reverse]
      array[i-1], array[i] = array[i], array[i-1]
      is_sorted = false
    end
  end

  is_sorted ? array : bubble_sort(array, opt)
end

puts bubble_sort([4,2,5,3,1])
puts bubble_sort([4,2,5,3,1], reverse: true)
