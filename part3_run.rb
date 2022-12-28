# frozen_string_literal: true

require_relative 'part3'

first_function_lambda = ->(x) { Math.log(x, Math.exp(1)) / x }
second_function_lambda = ->(x) { Math.sin(x) * Math.cos(x) }

first_function_proc = proc { |x| Math.log(x, Math.exp(1)) / x }
second_function_proc = proc { |x| Math.sin(x) * Math.cos(x) }

p = Integral.new(0.1, 1, 100_000)
puts "First function (lambda function): #{p.intg(&first_function_lambda)}"

p = Integral.new(0, 2, 100_000)
puts "Second function (lambda function): #{p.intg(&second_function_lambda)}"

p = Integral.new(0.1, 1, 100_000)
puts "First function (with block): #{p.intg { |x| Math.log(x, Math.exp(1)) / x }}"

p = Integral.new(0, 2, 100_000)
puts "Second function (with block): #{p.intg { |x| Math.sin(x) * Math.cos(x) }}"

p = Integral.new(0.1, 1, 100_000)
puts "First function (proc function): #{p.intg(&first_function_proc)}"

p = Integral.new(0, 2, 100_000)
puts "Second function (proc function): #{p.intg(&second_function_proc)}"
