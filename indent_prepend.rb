# In this task you should use #prepend and #include methods
# in different combinations to achieve desired result, described at the bottom
# Hint: class method #ancestors should help you to understand ancestors chain in different cases
# Good Luck!

module A
  def hello
    super if defined?(super)
    puts "hello from A"
  end
end

module B
  def hello
    super if defined?(super)
    puts "hello from B"
  end
end

class ACB
  include A
  prepend B

  def hello
    super if defined?(super)
    puts "hello from C"
  end

end

class ABC
  include A
  include B

  def hello
    super if defined?(super)
    puts "hello from C"
  end
end

class BAC
  include B
  include A

  def hello
    super if defined?(super)
    puts "hello from C"
  end

end

class CBA
  prepend B
  prepend A

  def hello
    super if defined?(super)
    puts "hello from C"
  end

end

class CAB
  prepend A
  prepend B

  def hello
    super if defined?(super)
    puts "hello from C"
  end

end



puts 'order => A,C,B'
c = ACB.new
c.hello
puts 'order => A,B,C'
c = ABC.new
c.hello
puts 'order => B,A,C'
c = BAC.new
c.hello
puts 'order => C,B,A'
c = CBA.new
c.hello
puts 'order => C,A,B'
c = CAB.new
c.hello



# should be called in order => A,C,B
# should be called in order => A,B,C
# should be called in order => B,A,C
# should be called in order => C,B,A
# should be called in order => C,A,B












































































