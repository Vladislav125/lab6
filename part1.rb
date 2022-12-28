# frozen_string_literal: true

# class for counting function
class CountSum
  def self.count_sum
    accur_first = 1e-3
    accur_second = 1e-4
    result_first = sum(accur_first)
    result_second = sum(accur_second)
    [result_first, result_second]
  end

  def self.initialize_values
    @x_original = 2
    @y_original = @x_original / 2
    @y_counted = 0
    @number = 1
  end

  # This method calls :reek:TooManyStatements
  def self.sum(exactness)
    initialize_values
    loop do
      @y_counted += ((-1)**(@number - 1)) * Math.sin(@number * @x_original) / @number
      @number += 1
      break if (@y_original - @y_counted).abs < exactness
    end
    [@y_counted, @number]
  end
end
