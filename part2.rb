# class for counting function
class CountSumEnumerable
  def self.count_sum(accur)
    x_original = 2
    y_original = x_original / 2
    value_counted_for_n = lambda { |n| ((-1)**(n - 1) * Math.sin(n * x_original)) / n }
    values = (1..Float::INFINITY).lazy.map { |n| value_counted_for_n[n] }
    values_sum = (1..Float::INFINITY).lazy.map { |n| values.take(n).inject(:+) }
    count = lambda { |eps| values_sum.take_while { |counted_value| (y_original - counted_value).abs > eps} }
    count = count[accur].force
    [count.count, count[-1]]
  end
end

puts CountSumEnumerable.count_sum(0.001)
