def rotate_left(array, rotations)
  return array.rotate(rotations)
end

fruits = %w{apple pear melon banana}

puts rotate_left(fruits, 1).to_s
puts rotate_left(fruits, 3).to_s
puts rotate_left(fruits, 5).to_s
