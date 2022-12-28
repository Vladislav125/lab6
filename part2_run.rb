# frozen_string_literal: true

require_relative 'part2'

result = CountSumEnumerable.count_with_accuracy
puts "Значение функции, вычисленное с точностью 1e-3: #{result[0][0]}"
puts "Количество итераций: #{result[0][1]}"
puts "Значение функции, вычисленное с точностью 1e-4: #{result[1][0]}"
puts "Количество итераций: #{result[1][1]}"
puts "Количество итераций увеличилось на #{result[1][0] - result[0][0]}"