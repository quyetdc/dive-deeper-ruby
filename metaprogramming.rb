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