# This class for integrals counting
class Integral
  def initialize(a_value, b_value, n_value = 10)
    @n_value = n_value.to_f
    @a_value = a_value.to_f
    @b_value = b_value.to_f
  end

  def intg
    sum = 0
    step = (@b_value - @a_value) / @n_value
    loop do
      sum += yield(@a_value)
      @a_value += step
      break if @a_value >= @b_value
    end
    sum * step
  end
end