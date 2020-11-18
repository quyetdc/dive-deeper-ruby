# Metaprogramming lets you inspect & mess around with the internals of Ruby objects.
# Definition (meta): 
		# "A prefix added to the name of a subject that analyzes the original one but at a more abstract, higher level."

# With metaprogramming you can also generate new code dynamically, like defining new methods during the execution of your program.
		# That's how methods like attr_reader or attr_writer work!



# Using the "send" method
send(:puts, "Hello")

# Send will ignore the fact that the method is private and call it anyway
class PrivateClass
	private

	def private_method
		puts "This text is inside a private method"
	end
end

p = PrivateClass.new

begin
	p.private_method 
rescue NoMethodError => e
	p "Error occur: " + e.message # private method `private_method' called for #<PrivateClass:0x00007fc98503ce78>
end

p.send(:private_method) # This text is inside a private method


# SELF
	# The special variable self holds a reference to the current object.

# Top-level context, self is just an instance of Object
p "********* ------ *********"
puts self # => main

class FindingSelf 
  # self is the class 
  p '+++'
	puts self # => FindingSelf

	def show_self
		# self is the object instance
		p '+++'
		puts self # => <FindingSelf:0x00007fe085835320>
	end 
end

fs = FindingSelf.new
fs.show_self

# respond_to? 
 
class A 
	def say
  end
end

class B < A 
end

p B.new.respond_to?(:say) # => true
# to ask an object if it can respond to a certain method call.


# The Method Method (not a typo)
class Animal 
	def self.speak 
	end
end

p Animal.method(:speak).source_location


# Dynamic Constant

class DynamicColors
	def self.define_constants
		colors =  {
								"red": "#111",
								"green": "#222",
								"yellow": "#333"
							}

		colors.each { |color, code| const_set(color.upcase, code)}
	end
end

DynamicColors.define_constants
p DynamicColors::GREEN # => "#222"


# METACLASS

# Every object in Ruby has its own metaclass.
example = "I'm a string object"

def example.something 
	# singleton method which available only to that single instance
  self.upcase
end

p example.something
# I'M A STRING OBJECT



# Similarly we can use: define_method & define_singleton_method
# => create code that is DRY by avoiding repetitions

class Developer
  ["frontend", "backend"].each do |method|
    define_method "coding_#{method}" do
      p "writing " + method.to_s
    end
  end
end
developer = Developer.new

developer.coding_frontend
# "writing frontend"

developer.coding_backend
# "writing backend"


class DryDeveloper

  def method_missing method, *args, &block
    return super method, *args, &block unless method.to_s =~ /^coding_\w+/
    self.class.send(:define_method, method) do
      p "writing " + method.to_s.gsub(/^coding_/, '').to_s
    end
    self.send method, *args, &block
  end

end

developer = DryDeveloper.new

developer.coding_frontend
developer.coding_backend
developer.coding_debug


# HOOK
module Products
	def self.included(base)
		puts "> Products included into #{base}!" 
	end
end

class Shop 
	include Products 
	# => Products included into Shop!
end

class Cart
	include Products
	# => Products included into Cart!
end
