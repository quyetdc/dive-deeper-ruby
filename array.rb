users = Array.new
users = []

users = ["john", "david", "peter"]

# numbers = *1,2,3
*numbers = 1,2,3

*a, b = 1,2,3,4
# a = [1, 2, 3]
# b = 4


a, *b, c = 1,2,3,4

# a = 1
# b = [2, 3]
# c = 4


# Same effect as the last example, but faster to type
users = %w(john david peter)

users.first(3) # First three elements of the array
users.last(3)  # Last three elements of the array

# Both of these have the same effect, << is prefered.
users.push "andrew"
users << "andrew"


last_user = users.pop # Removes the last element from the array and returns it
users.delete_at(0)     # Removes the element at index 0


users.unshift "robert"  # Adds an element in front of the array
users.shift             # Removes the first element of the array and returns it


users.size # 3

numbers = [3, 2, 7, 12, 2, 49]

numbers.uniq
users.sort
users.sample

[1,2,3].count { |n| n.even? }

users.each { |item| puts item }

users.map { |user| user.capitalize }

[[1, 2, 3], [4, 5, 6]].flatten  # Output: [1, 2, 3, 4, 5, 6]


numbers = [3, 7, 12, 2, 49]
numbers.select { |n| n > 10 } # => 12, 49

p users.concat(['new_users'])  # Faster, because it works in-place
# users += new_users


a = [1,2,3,4]
b = [4]

a - b # Output: [1,2,3]
a & b # [4]
a | b # [1,2,3,4]
a.concat b # [1,2,3,4,4]


a = [1,2,3,4]
p 'slice: ' + a.slice(1, 3).inspect

# The inject and reduce methods are aliases. There
# is no performance benefit to either.

# Sum some numbers
(5..10).reduce(:+)                             #=> 45
# Same using a block and inject
(5..10).inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
(5..10).reduce(1, :*)                          #=> 151200
# Same using a block
(5..10).inject(1) { |product, n| product * n } #=> 151200
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end
longest                                        #=> "sheep"