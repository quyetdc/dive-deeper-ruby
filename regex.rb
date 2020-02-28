"Do you like cats?" =~ /like/ #7

def contains_vowel(str)
  str =~ /[aeiou]/
end

contains_vowel("test") # returns 1
contains_vowel("sky") # returns nil

"5a5".match(/\d.\d/)

# Note that this will also match some invalid IP address
# like 999.999.999.999, but in this case we just care about the format.
def ip_address?(str)
  # We use !! to convert the return value to a boolean
  !!(str =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
end

ip_address?("192.168.1.1") # returns true ip_address?("0000.0000") # returns false

# Example: Find if a string is exactly five letters long.
#   This code will match because it has at more than five, but it's not what we want.
"Regexp are cool".match /\w{5}/

# Instead, we will use the 'beginning of line' and 'end of line' modifiers:
"Regexp are cool".match /^\w{5}$/
# This time it won't match because of the extra modifiers.

p "123abc".match /\d+/
p "123abc".match /^\d+$/
p "123abc".match /[^\d+]/

p "group"
m = "name: John, age: 20, country: USA".match(/name: (?<name>\w+)/)
p m[:name]

p "regex are great".gsub(/(\w+)/, '-\1-'); #"-regex- -are- -great-"

p "regex are great".gsub(/(\w+) (\w+)/, '-\2-'); #"-are- great"
p "regex are great".gsub(/(\w+) (\w+)/, '-\1-'); #-regex- great
p "regex are great".gsub(/(\w+) (\w+)/, '-\1\2-'); #"-regexare- great"

# Check if there's number after word
p "abc.123".match?(/(\w)(?=\d)/)


# p "abc.123".gsub(/\?=\d/, '*')

"this is some string".scan(/\w+/)
# => ["this", "is", "some", "string"]

str.gsub(/\w+/, &:capitalize) #Example: Capitalize all words in a string

"camelCasingTestFooBar".split(/(?=[A-Z])/) #Example: Split a camelCasing string

