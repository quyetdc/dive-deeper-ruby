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