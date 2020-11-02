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

