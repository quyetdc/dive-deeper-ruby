animals = ['tigers', 'elephants']
text = "In this Zoo we have tigers, elephants & snakes"

# puts Regexp.union(animals)
# => /tigers|elephants/

# puts text.gsub(Regexp.union(animals), "cats")
# puts text

text_with_number = "a1 b2 c3"

numbers = text_with_number.gsub(/\d+/) { |number| number.next }

# puts numbers
# puts text_with_number.gsub(/\d+/).to_a # [1, 2, 3]
# puts text_with_number.gsub(/\d+/, '-') # a- b- c-
#

split_string = 'abcd - 123 - xyz'
# puts split_string.split('-').to_s


# puts "Type your name: "
# name = gets.chomp
# name = gets
# p name

# MUTABLE String

a = "mutable string"
b = "mutable string"

p a.object_id == b.object_id


a = "mutable string"
b = a
p a.object_id == b.object_id

a.freeze
b.freeze

p a.object_id == b.object_id

a = "mutable string".freeze
b = "mutable string".freeze

p a.object_id == b.object_id

# a[0] = "" # Runtime error <- cannot change the frozen string
#
puts a

animals = ['dog', 'cat']
animals.freeze

animals[0].replace('cow')
p animals.to_s


# animals[0] = 'cow'
# p animals.to_s # <- runtime error : can't modify frozen array

# animals.push('cow') # <- runtime error : can't modify frozen array

# p animals.to_s

