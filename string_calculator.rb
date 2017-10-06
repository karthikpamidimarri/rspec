require 'minitest/autorun'

class Calculator
  attr_reader :digits
  def initialize(digits_string)
    @digits = digits_string.split(',').map{ |n| n.to_i}
  end

  def sum
    digits.inject(:+)
  end
end

describe Calculator do 
  it 'sums provided digits' do
    calc = Calculator.new('1,2,3,4,5')
    calc.sum.must_equal(15)
    calc1 = Calculator.new('1,2,3,4,5,5')
    calc1.sum.must_equal(20)
  end
end
