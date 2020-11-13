"Do you like cats?" =~ /like/ #7

def contains_vowel(str)
  str =~ /[aeiou]/
end

contains_vowel("test") # returns 1
contains_vowel("sky") # returns nil


# Ranges
# 	[0-9] matches any number from 0 to 9
# 	[a-z] matches any letter from a to z (no caps)
#  	[^a-z] matches the opposite of this range, 
# 				 in this case anything that's not a letter in the a-z range
# 	\w is equivalent to [0-9a-zA-Z-]
# 	\d is the same as [0-9]
# 	\s matches spaces
# 	\W anything that's not in [0-9a-zA-Z-]
# 	\D anything that's not a number
# 	\S anything that's not a space

def contain_number str
	return true if str =~ /[0-9]/
	false
end

p contain_number 'test'
p contain_number '21st century'


# Using a Wildcard
# 	The dot character . matches anything but new lines.

"5a5".match(/\d\.\d/) # nil 
"5.5".match(/\d\.\d/) # match




# Modifiers
# +       1 or more
# *       0 or more
# ?       0 or 1
# {3,5}   between 3 and 5
# {5}     exact match ( 5 times )

# /^ Start string
# $/ End String

# Note that this will also match some invalid IP address
# like 999.999.999.999, but in this case we just care about the format.
def ip_address?(str)
  # We use !! to convert the return value to a boolean
  !!(str =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
end

ip_address?("192.168.1.1") # returns true 
ip_address?("0000.0000") # returns false



# Example: Find if a string is exactly five letters long.
#   This code will match because it has at more than five, but it's not what we want.
"Regexp are cool".match /\w{5}/

# Instead, we will use the 'beginning of line' and 'end of line' modifiers:
"Regexp are cool".match /^\w{5}$/
# This time it won't match because of the extra modifiers.

p "123abc".match /\d+/
p "123abc".match /^\d+$/


# MATCH GROUP

p "group"
m = "name: John, age: 20, country: USA".match(/name: (?<name>\w+), age: (?<age>\d+), country: (?<country>\w+)/)
p m[:name]
p m[:age]
p m[:country]

m = "David 30".match /(?<name>\w+) (?<age>\d+)/
m[:age]   # => "30"
m[:name]  # => "David"



p "regex are great".gsub(/(\w+)/, '-\1-'); #"-regex- -are- -great-"

p "regex are great".gsub(/(\w+) (\w+)/, '-\2-'); #"-are- great"
p "regex are great".gsub(/(\w+) (\w+)/, '-\1-'); #-regex- great
p "regex are great".gsub(/(\w+) (\w+)/, '-\1\2-'); #"-regexare- great"

# Check if there's number after word
p "abc.123".match?(/(\w)(?=\d)/)


# p "abc.123".gsub(/\?=\d/, '*')

"this is some string".scan(/\w+/)
# => ["this", "is", "some", "string"]

