# frozen_string_literal: true

input = File.readlines('./input.txt')

valid_passwords = input.count do |attempt|
  range, char, password = attempt.split(' ')
  low, high = range.split('-').map(&:to_i)
  (low..high).cover?(password.count(char))
end

puts "Solution for day 2 part a: #{valid_passwords}"

valid_passwords = input.count do |attempt|
  positions, char, password = attempt.delete(':').split(' ')
  a, b = positions.split('-').map(&:to_i).map(&:pred)
  (password[a] == char) ^ (password[b] == char)
end

puts "Solution for day 2 part b: #{valid_passwords}"
