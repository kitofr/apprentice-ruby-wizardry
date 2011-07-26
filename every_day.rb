puts "========================== Every Day Spells =========================="
puts "", "------------------------------------- Argument Array -------------------------------"
puts "Collapse list of arguments into an array"

def my_method(*args)
  args.map {|arg| arg.reverse }
end

my_method('abc', 'xyz', '123') 

puts "", "------------------------------------- Named Arguments -------------------------------"
puts "Collect method arguments into a hash to identify them by name."

def my_method(args)
 args[:arg2]
end

my_method(:arg1 => "A", :arg2 => "B", :arg3 => "C")

puts "", "------------------------------------- Kernel Method -------------------------------"
puts "Define a method in module {{{Kernel}}} to make the method available to all objects."

module Kernel
  def a_method
    "a kernel method"
  end
end

a_method # => "a kernel method"

puts "", "------------------------------------- Self Yield -------------------------------"
puts "Pass self to the current block."

class Person
  attr_accessor :name, :surname
  def initialize
    yield self
  end
end

joe = Person.new do |p|
  p.name = 'Joe'
  p.surname = 'Smith'
end

puts joe.name

def person(&block)
  Person.new(&block)
end

tom = person do |p| 
  p.name = 'Tom'
  p.surname = 'Collins' 
end

puts "", "------------------------------------- Symbol To Proc -------------------------------"
puts "Convert a symbol to a block that calls a single method."

[1, 2, 3, 4].map(&:even?)

