========================== Debugging ==========================
puts "", "------------------------------------- Good friends to have -------------------------------"

begin
  raise "hell"
rescue
  puts "$! => #{$!}"
end

puts "", "What about some stack/backtrace info?"
begin
  raise "another kind of hell"
rescue
  puts "$! with backtrace: #{$!.backtrace}"
end

puts "", "Where the heck am I?"
puts __FILE__
puts "", "and on what line?"
puts __LINE__
puts "", "and what the heck did you load?!"
puts $LOAD_PATH

puts "", "------------------------------------- Open Class -------------------------------"
puts "Modify an existing class."

class String
  def my_string_method
    "my method"
  end
end
"abc".my_string_method

puts "", "------------------------------------- Around Alias -------------------------------"
puts "Call the previous, aliased version of a method from a redefined method"

class String
  alias :old_reverse :reverse
  def reverse
    "x#{old_reverse}x"
  end
end

"abc".reverse 


puts "", "------------------------------------- Hook Method -------------------------------"
puts "Override a method to intercept object model events."

$INHERITORS = []

class C
  def self.inherited(subclass)
    $INHERITORS << subclass
  end
end

class D < C; end
class E < C; end
class F < C; end

$INHERITORS
