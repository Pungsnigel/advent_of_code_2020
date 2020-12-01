#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt')

result = input.map(&:to_i).combination(2).find { |combination| combination.sum == 2020 }.reduce(:*)
puts "Day1 first part: #{result}"

result = input.map(&:to_i).combination(3).find { |combination| combination.sum == 2020 }.reduce(:*)
puts "Day1 second part: #{result}"
