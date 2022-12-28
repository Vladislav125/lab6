# frozen_string_literal: true

# class for counting function
class CountSumEnumerable
  def self.count_with_accuracy
    accur_first = 1e-3
    accur_second = 1e-4
    result_first = count_sum(accur_first)
    result_second = count_sum(accur_second)
    [result_first, result_second]
  end

  def self.initialize_values
    @x_original = 2
    @y_original = @x_original / 2
  end

  # This method calls :reek:DuplicateMethodCall, :reek:NestedIterators, :reek:TooManyStatements
  def self.count_sum(accur)
    initialize_values
    iter = 1
    count = lambda { |eps|
      template_count.drop_while do |counted_value|
        iter += 1
        (@y_original - counted_value).abs > eps
      end
    }
    count = count[accur].first
    [iter, count]
  end

  # This method calls :reek:DuplicateMethodCall, :reek:TooManyStatements
  def self.template_count
    range = (1..Float::INFINITY)
    value_counted_for_n = ->(number) { ((-1)**(number - 1) * Math.sin(number * @x_original)) / number }
    values = range.lazy.map { |number| value_counted_for_n[number] }
    range.lazy.map { |number| values.take(number).inject(:+) }
  end
end
