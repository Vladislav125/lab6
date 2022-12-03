# frozen_string_literal: true

# class for counting function
class CountSum
  def self.count_sum
    exactness1 = 1e-3
    exactness2 = 1e-4
    result1 = sum(exactness1)
    result2 = sum(exactness2)
    puts "Значение функции, вычисленное с точностью 1e-3: #{result1[0]}"
    puts "Количество итераций: #{result1[1]}"
    puts "Значение функции, вычисленное с точностью 1e-4: #{result2[0]}"
    puts "Количество итераций: #{result2[1]}"
    puts "Количество итераций увеличилось на #{result2[1] - result1[1]}"
  end

  def self.sum(exactness)
    x_original = 2
    y_original = x_original / 2
    y_counted = 0
    number = 1
    loop do
      y_counted += ((-1)**(number - 1)) * Math.sin(number * x_original) / number
      number += 1
      break if (y_original - y_counted).abs < exactness
    end
    [y_counted, number]
  end
end
