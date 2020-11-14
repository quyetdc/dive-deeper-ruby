# Enumerable is a module that is included in Array , Hash , Range and a few other classes

# inject
# total: accumulator /əˈkjuːmjəleɪtə(r)/
p [10,20,30].inject { |total, num| total + num } # 60
p [10,20,30].inject(&:+) # 60

prices = { bacon: 10, coconut: 20 }
prices.inject(0) { |total, (key, value)| total + value } # 30


p "all + #{ %w(cat dog cow).all? { |word| word.length == 3 } }"
p "any + #{ %w(cat dog cow).any? { |word| word.length == 3 } }"
p "none + #{ %w(cat dog cow).none? { |word| word.length == 3 } }"


# Use reject (which is the opposite of select ) when you want all the items that don't
numbers = [1, 2, 3, 4, 5]
p numbers.reject(&:odd?) # [2, 4]
p numbers.partition(&:even?) # [[2, 4], [1, 3, 5]]



# Implement EACH
class Numbers
	def initialize *numbers
		@numbers = *numbers
	end

	def size
		@numbers.size
	end

	def each
		index = 0
		while index < size
			yield @numbers[index]
			index += 1
		end
	end
end

numbers = Numbers.new 1, 2, 3
numbers.each { |number|  puts "#{number}" }

# Implement MAP
Book = Struct.new(:title, :author, :pages)

class Library
	attr_accessor :books

	def initialize
		@books = [
			Book.new('Eloquent Ruby', 'Russ Olsen', 448),
			Book.new('Confident Ruby', 'Avdi Grimm', 296)
		]
	end

	# loop
	# do sth with each element
	# return array of results
	def map
		results = []
		@books.each do |book|
			results << yield(book)
		end

		results
	end
end

p "MAP"
library = Library.new
p library.map(&:title)

# If you take just one thing out of this chapter, remember the top 3 Enumerable methods:
	# map (TRANSFORM) 
	# select (FILTER) 
	# inject (COMBINE)
