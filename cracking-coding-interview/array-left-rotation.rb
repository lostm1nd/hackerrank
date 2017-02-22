def rotate_left(array, rotations)
  return array.rotate(rotations)
end

fruits = %w{apple pear melon banana}

puts rotate_left(fruits, 1)
puts rotate_left(fruits, 3)
puts rotate_left(fruits, 5)
