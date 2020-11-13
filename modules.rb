# The main purpose of modules is to group together methods and constants. 
# One difference with classes is that you can't create instances of a module.

module Numbers 
	PI = 3.141592
end
#=> puts Numbers::PI

module Numbers
	def self.double(number)
		number * 2 
	end
end
puts Numbers.double(30)


module Life 
end

class Animal 
	include Life
end


module ClassMethods 
	def add_product
		puts 'Add Product'
	end
end

class Store
	# Add methods from the module to the singleton class of this object 
	extend ClassMethods
end 

Store.add_product


 
module Formatter 
	# This defines all the methods in the module as class-level methods, 
	# which lets you call the methods directly from the module
	extend self
	def wrap_with(symbol, str) 
		"#{symbol * 4} #{str} #{symbol * 4}"
	end 
end

puts Formatter.wrap_with("*", "hello")