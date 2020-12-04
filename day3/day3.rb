input = File.readlines('./input.txt')

trees_encountered = input.each_with_index.count do |line, i|
  line[i * 3 % (line.length - 1)].eql?('#')
end
puts "Solution for day 3 part a: #{trees_encountered}"

slope_instructions = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
trees_per_slope = slope_instructions.map do |x_jump, y_jump|
  input.each_with_index.count do |line, i|
    next unless (i % y_jump).zero?

    line[i * x_jump / y_jump % (line.length - 1)].eql?('#')
  end
end
slopes_multiplied = trees_per_slope.reduce(:*)
puts "Solution for day 3 part a: #{slopes_multiplied}"
