puts "", "----------------------------- Object Model -----------------------------------"
puts "Execute everything... all the time!"

10.times do 
  class C
    puts "hello"
  end
end

puts "", "----------------------------- Class names are contants... :) --------------------------------"
c = Class.new
puts c.name
MyConstant = c
my_object = MyConstant.new

puts MyConstant.name


puts self
puts self.class
puts class C;self; end
class Z; puts self; end
puts class Z; 1; end

puts "", "-------------------------- A bit about scoping -----------------"
class MyClass
  def foo
    def bar; "BAR!"; end
  end
end

obj = MyClass.new
puts "Foo: #{obj.foo}"
puts "Bar: #{obj.bar}"

puts "", "-------------------------- 'My' stuff -----------------"
puts "Instance variables belong to the class or the object. Depending on scope."
class MyClass
  @my_var = 1

  def self.read; @my_var; end
  def set; @my_var = 42; end
  def read; @my_var; end
end

obj = MyClass.new
obj.set
puts "obj.read: <#{obj.read.nil?}>"
puts "MyClass.read: #{MyClass.read}"


puts "", "-------------------------- Extending things runtime -----------------"
def add_method_to(klass)
  klass.class_eval do
    def ready!; "#{self} hollers: Ready to serve!"; end
  end
end

add_method_to String
puts "Private".ready!


puts "", "-------------------------- Open Objects? (Object Extension) -----------------"
obj = Object.new

def obj.another_method
  "Another one!"
end

puts obj.another_method


puts "", "-------------------------- Class Extension -----------------"
puts "Define class methods by mixing a module into a class's eigenclass"

class C; end

module M
  def my_method
    'a class method'
  end
end

class << C
  include M
end

obj = C.new
puts obj.my_method
puts C.my_method

class A
  include M
end

puts A.my_method

puts "", "-------------------------- Ghost Methods -----------------"
puts "Respond to a message that doesn't have an associated method."
class C
  def method_missing(name, *args)
    name.to_s.reverse
  end
end

obj = C.new
puts obj.si_ti_yaw_eht_ynnuf
puts obj.send "hello"

class << C
  def method_missing(name,*args)
    puts "hej"
  end
end
C.newasdf

puts "", "-------------------------- Class Macro -----------------"
puts "use a class method in a class definition."

class C; end

class << C
  def my_macro(arg)
    puts "my_macro(#{arg}) called"
  end
end

class C
  my_macro :x
end

puts "", "-------------------------- String of Code -----------------"
puts "Execute a string of code"

add_one = "puts '1 + 2 = #{1 + 2}'"
eval(add_one)

puts "", "-------------------------- Blank Slate -----------------"
puts "Remove methods from an object!"

class C
  def method_missing(name, *args)
    "Booh!"
  end
end

obj = C.new
puts obj.to_s

class C
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /method_missing|respond_to?|object_id|^__/
  end
end

puts obj.to_s 

puts "", "-------------------------- Putting 1 and 1 together (Active Record Style Magic) -----------------"

module Table
 def self.included(base)
   base.extend(ClassMethods)
 end

 module ClassMethods
   def query
     "SELECT * FROM #{name}"
   end
 end
end

class Record
  include Table 

  def self.inherited(child)
  end
end

class MyClass < Record
end

MyClass.query
