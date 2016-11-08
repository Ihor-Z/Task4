# Описати клас Formula, конструктор якого буде приймати число. Клас повинен мати наступні методи:
#
#                                                                                             add
# subtract
# divide
# multiply
# result
# to_s
#
# І працюватиме наступним чином:
#
#                             irb(main):109:0> a = Formula.new 5
# => <Formula: 5>
#     irb(main):110:0> a.add 10
# => 15
# irb(main):111:0> a.subtract 3
# => 12
# irb(main):112:0> a.divide 6
# => 2
# irb(main):113:0> a.add 8
# => 10
# irb(main):114:0> a.multiply 8
# => 80
# irb(main):115:0> a - 12
# => 68
# irb(main):116:0> a / 2
# => 34
# irb(main):117:0> a + 7
# => 41
# irb(main):118:0> a * 3
# => 123
# irb(main):119:0> a.result
# => 123
# irb(main):120:0> a.to_s
# => "((((5 + 10 - 3) / 6 + 8) * 8 - 12) / 2 + 7) * 3"
#
# 115-118 - не обов'язково реалізовувати. Але було б круто




class Formula

  Operation = Struct.new(:operator, :operand)

  attr_accessor :result

  def initialize(number)
    @result = number
    @operations = [Operation.new(nil, number)]
  end

  def add(number)
    @operations << Operation.new('+', number)
    @result += number
  end

  def subtract(number)
    @operations << Operation.new('-', number)
    @result -= number
  end

  def divide(number)
    @operations << Operation.new('/', number)
    @result /= number
  end

  def multiply(number)
    @operations << Operation.new('*', number)
    @result *= number
  end

  def to_s
    str = ''
    previous_operator = nil
    @operations.each do |operation|
      if %w(* /).include?(operation.operator) && %w(+ -).include?(previous_operator)
        str = "(#{str}) #{operation.operator} #{operation.operand}"
      else
        str += " #{operation.operator} #{operation.operand}"
      end
      previous_operator = operation.operator
      str.strip!
    end

    str
  end

  alias_method :+, :add
  alias_method :-, :subtract
  alias_method :/, :divide
  alias_method :*, :multiply
end

a = Formula.new 5
puts 'Formula.new 5'
puts a.result
a / 1
puts 'a / 1'
puts a.result
a.add 10
puts 'a.add 10'
puts a.result
a.subtract 3
puts 'a.subtract 3'
puts a.result
a.divide 6
puts 'a.divide 6'
puts a.result
a.add 8
puts 'a.add 8'
puts a.result
a.multiply 8
puts 'a.multiply 8'
puts a.result
a-12
puts 'a-12'
puts a.result
a/2
puts 'a/2'
puts a.result
a+7
puts 'a+7'
puts a.result
a*3
puts 'a*3'
puts a.result
a.result
puts 'a.result'
puts a.result

puts 'a.to_S'
puts a.to_s











































































