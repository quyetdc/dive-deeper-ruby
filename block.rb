# Form 1: recommended for single-line blocks
[1, 2, 3].each { |num| print "#{num}" + ' ' }

# Form 2: recommended for multi-line blocks
[1, 2, 3].each do 
	|num| print "#{num}" + ' '
end


print "\n"

# Yield  /ji:ld/ is a Ruby keyword that calls a block when you use it.
# ex

def print_yield
	yield
end

print_yield { puts "This line is being called and printed by yield command" }

# multi-call yield

def multi_yield
	yield 1
	yield 2
end

multi_yield { |number| puts "#{number} times 10 equals #{number * 10}" }

def yield_multi_params
	yield 1, 2
end

yield_multi_params { |number1, number2| puts "#{number1} times #{number2} equals #{number1 * number2}" }


def explicit_block(&block)
	block.call # same as field
end

explicit_block { puts 'Explicit block called' }

def yield_with_exception
	# block_given? is used to check if the method is called with a block parameter
	return 'No block given' unless block_given?

	yield
end

