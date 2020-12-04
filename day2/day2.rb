# frozen_string_literal: true

input = File.readlines('./input.txt')

def parse(attempt)
  range, char, password = attempt.delete(':').split(' ')
  low, high = range.split('-').map(&:to_i)
  [low, high, char, password]
end

valid_passwords = input.count do |attempt|
  low, high, char, password = parse(attempt)
  (low..high).cover?(password.count(char))
end

puts "Solution for day 2 part a: #{valid_passwords}"

valid_passwords = input.count do |attempt|
  a, b, char, password = parse(attempt)
  (password[a - 1] == char) ^ (password[b - 1] == char)
end

puts "Solution for day 2 part b: #{valid_passwords}"
