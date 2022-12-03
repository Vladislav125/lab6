# class for counting function
class CountSumEnumerable
  def self.count_sum(accur)
    x_original = 2
    iter = 1
    y_original = x_original / 2
    value_counted_for_n = lambda { |n| ((-1)**(n - 1) * Math.sin(n * x_original)) / n }
    values = (1..Float::INFINITY).lazy.map { |n| value_counted_for_n[n] }
    values_sum = (1..Float::INFINITY).lazy.map { |n| values.take(n).inject(:+) }
    count = lambda { |eps| values_sum.drop_while do |counted_value|
      iter += 1
      (y_original - counted_value).abs > eps
    end
    }
    count = count[accur].first
    [iter, count]
  end
end

puts CountSumEnumerable.count_sum(0.001)
