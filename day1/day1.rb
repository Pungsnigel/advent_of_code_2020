#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'

input = File.readlines('./input.txt')

Benchmark.bm do |benchmark|
  benchmark.report do
    result = input
             .map(&:to_i)
             .combination(2)
             .select { |a, b| a + b == 2020 }
             .flatten
             .reduce(:*)
    puts "Day1 first part: #{result}"
  end

  benchmark.report do
    result = input
             .map(&:to_i)
             .combination(3)
             .select { |a, b, c| a + b + c == 2020 }
             .flatten
             .reduce(:*)
    puts "Day1 second part: #{result}"
  end
end
