# frozen_string_literal: true

require_relative 'part3'

RSpec.describe Integral do
  describe 'class for testing part3.rb' do
    it 'should count with blocks' do
      value_first = Integral.new(0.1, 1, 1_000_000)
      value_second = Integral.new(0, 2, 1_000_000)
      expect(value_first.intg { |x| Math.log(x, Math.exp(1)) / x }).to eq(-2.6509594168851374)
      expect(value_second.intg { |x| Math.sin(x) * Math.cos(x) }).to eq(0.4134112836151868)
    end

    it 'should count with lambda functions' do
      first_function_lambda = ->(x) { Math.log(x, Math.exp(1)) / x }
      second_function_lambda = ->(x) { Math.sin(x) * Math.cos(x) }
      value_first = Integral.new(0.1, 1, 1_000_000)
      value_second = Integral.new(0, 2, 1_000_000)
      expect(value_first.intg(&first_function_lambda)).to eq(-2.6509594168851374)
      expect(value_second.intg(&second_function_lambda)).to eq(0.4134112836151868)
    end

    it 'should count with proc' do
      first_function_proc = proc { |x| Math.log(x, Math.exp(1)) / x }
      second_function_proc = proc { |x| Math.sin(x) * Math.cos(x) }
      value_first = Integral.new(0.1, 1, 1_000_000)
      value_second = Integral.new(0, 2, 1_000_000)
      expect(value_first.intg(&first_function_proc)).to eq(-2.6509594168851374)
      expect(value_second.intg(&second_function_proc)).to eq(0.4134112836151868)
    end
  end
end