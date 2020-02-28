
######################################################
## Interactive Ruby Exercises

# Run this file as a regular ruby program
# then scroll down to the bottom & follow the instructions.

# Windows users: You may not be able to see the check marks & colored text.
# If that's the case you can run this code in https://repl.it/languages/ruby

######################################################
## Support methods - Do not change

# I'm creating a Null object here to be used as a blank in the
# fill-in the blanks exercises.
#
# https://en.wikipedia.org/wiki/Null_object_pattern

REPLACE_ME = Object.new

def REPLACE_ME.method_missing(name, *, &block)
  self
end

def REPLACE_ME.inspect
  "REPLACE_ME"
end

def REPLACE_ME.to_int
  99999
end


class TestingFramework
  def self.method_added(name)
    methods << name
  end

  def self.run_tests
    test_class = self.new

    methods.each { |m| test_class.send(m) }
  end

  def self.methods
    @methods ||= []
  end

  def assert_equal(expected, actual, msg = "")
    puts "\u001b[37;1m==> #{msg}\u001b[0m"

    if expected == actual
      puts "    \u001b[32;1m✓\u001b[0m"
    else
      puts "   \u001b[36m #{actual.inspect}\u001b[0m is not \u001b[36m#{expected.inspect}\u001b[0m"

      exit
    end
  end
end

######################################################
## Tests - Change only where it says "REPLACE_ME"

# Run this file as you make changes, your goal is to fill-in the blanks (the REPLACE_ME).
# You'll see a checkmark for every completed exercise.

# Example
#
# In the test "Return the letter b from the given array"
# You get: nil is not "b"
#
# The first value (nil) is the value being returned by the code (2nd argument to assert_equal)
# But that's not what we want, we want "b"
#
# You have to change array[REPLACE_ME] to array[1]

class Tutorial < TestingFramework
  def test_example
    assert_equal(1, 1, "Example exercise")
  end

  def test_empty_array
    assert_equal([], [], "Create an empty array")
  end

  def test_array_index
    assert_equal(10, (0..9).to_a.size, "Create a 10 element array")
  end

  def test_array_element
    array = %w(a b c d e f)

    assert_equal("b", array[1], "Return the letter b from the given array")
  end

  def test_inject_method
    array = [1,1,2,3,4,5]

    assert_equal(16, array.sum, "Add up all the numbers from the given the array & return the total")
  end
  # Hint: If you don't remember how a Ruby method works it's perfectly OK
  # to look it up. That's what the Ruby documentation is for.

  def test_map_method
    array = %w(ruby map method)
    assert_equal(["RUBY", "MAP", "METHOD"] , array.map {|e| e.upcase}, "Convert every string inside the given array to be uppercase")
  end

  def test_select_method
    array = %w(a b cc)
    assert_equal(["a", "b"], array.select {|e| e.length == 1}, "Return an array with only strings of size one")
  end

  def test_string_substitution
    string = "dog"

    # assert_equal("cat", string.gsub('dog', 'cat'), "Use the gsub method to replace the word dog with cat")
    assert_equal("cat", string.gsub(/dog/, 'cat'), "Use the gsub method to replace the word dog with cat")
  end

  def test_string_last
    string = "cat"

    assert_equal("t", string[2], "Return the last character from the given string")
  end

  def test_join
    array = [1,2,3,4,5]

    assert_equal("1 2 3 4 5", array.join(' '), "Use the given array & the join method to return the expected value")
  end

  def test_split
    string = "a,b,c"

    assert_equal(%w(a b c), string.split(','), "Use the given string & the split method to produce the expected value")
  end

  def test_hash_element
    hash = { bacon: 100, apple: 200, almond: 300 }

    assert_equal(200, hash[:apple], "Return the value of 'apple' from the given hash")
  end

  def test_hash_update
    hash = { bacon: 100, apple: 200, almond: 300 }

    assert_equal(250, hash[:apple] = 250, "Change the value of 'apple' to 250")
  end

  def test_hash_default
    hash = Hash.new(0)

    assert_equal(0, hash[:foo], "Create a hash that returns 0 as a default value")
  end

  def test_range
    assert_equal(true, (0..5).include?(5), "Create a range that includes the Integer 5")
  end

  def test_even
    integer = 10

    assert_equal(true, integer.even?, "Given an integer check wheter it's an even number or not")
  end
  # Hint: remember that integers are objects too, that means they have methods.
  # Is there any Integer method that could help you solve this?

  def test_count_element
    array = [2,2,2,3]

    assert_equal(3, array.count, "Given an array return the count of even numbers")
    # assert_equal(3, array.size, "Given an array return the count of even numbers")
    # assert_equal(3, array.length, "Given an array return the count of even numbers")
  end

  class Food
    def bacon
      "protein"
    end
  end

  def test_method
    assert_equal("protein", Food.new.bacon, "Use the bacon method from the given Food class")
  end

  class Rails
    def self.config
      {}
    end
  end

  def test_class_method
    assert_equal({}, REPLACE_ME, "Use the config method from the given Rails class")
  end
  # Hint: If you have trouble with this review instance method vs class method

  def test_parent_class
    assert_equal(BasicObject, REPLACE_ME.superclass, "Find out what class in Ruby has BasicObject as a direct superclass")
  end
  # Hint: Review the Ruby object model

  def test_block
    block = ->(x) { REPLACE_ME * 2 }

    assert_equal(100, block.call(50), "Make the block return the expected value")
  end

  def method_with_block
    return unless block_given?

    yield
  end

  def test_yield
    assert_equal("string", method_with_block { REPLACE_ME }, "Call the method & have it return the expected value")
  end

  module Methods
    def value
      123
    end
  end

  class Foo
    REPLACE_ME

    def value
    end
  end

  def test_module
    assert_equal(123, Foo.new.value, "Use prepend to include the Methods module into Foo")
  end

  def error
    REPLACE_ME
  rescue => e
    e.class
  end

  def test_thing
    assert_equal(NoMethodError, error, "Change the error method so it returns a NoMethodError")
  end
end

Tutorial.run_tests
