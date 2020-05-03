# A lambda is a way to define a block & its parameters with some special syntax. 
# which You can save this lambda into a variable for later use.

say_sth = -> { puts 'This is a lambda' }

say_other = lambda { puts 'We can use word lambda instead of ->' }

say_sth.call
say_other.call


times_two = ->(x) { x * 2 }
puts times_two.call(10)

# puts times_two.call(10, 2) # Exception: wrong number of arguments


a_proc = Proc.new { |x| x * 2 }

# Lambda is just a special Proc object
# when  checking `ls Proc` -> we see `lambda?`
# when checking 
# show-doc Proc#lambda


# Equivalent to Proc.new, except the resulting Proc objects
# check the number of parameters passed when called.

# Example

t = Proc.new { |x,y| puts "I don't care about arguments!" } 
t.call # "I don't care about arguments!"

# While
# puts times_two.call(10, 2) # Exception: wrong number of arguments

# Another difference is how they returns
# A lambda will return normally, like a regular method. 
# But a proc will try to return from the current context.

def call_proc
	puts "Before proc"
	my_proc = Proc.new { return 2 } 
	my_proc.call
	puts "After proc"
end

p call_proc 
# Before proc
# 2


def call_lambda
	puts "Before lambda"
	my_lambda = -> { return 2 } 
	my_lambda.call
	puts "After lambda"
end
p call_lambda
# Before lambda
# After lambda
# nil
