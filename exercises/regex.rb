
str.gsub(/\w+/, &:capitalize) #Example: Capitalize all words in a string

"camelCasingTestFooBar".split(/(?=[A-Z])/) #Example: Split a camelCasing string

# Check if the string is alphanumeric
def alphanumeric?(string)
  # string.match /^[A-z\d]+$/
  # instead of using ^ and $
  # We should use \A and \z
  # cause ^ and $ check for each line, so the string '__\nAStringNumber\n..' will pass
  # while with \A and \z, the whole string can't pass

  string.match /\A[A-z\d]+\Z/
end


# Complete the method/function so that it converts dash/underscore delimited words into camel casing.
# The first word within the output should be capitalized only if the original word was capitalized
#
#   Examples
#     to_camel_case("the-stealth-warrior") # returns "theStealthWarrior"
#     to_camel_case("The_Stealth_Warrior") # returns "TheStealthWarrior"

def to_camel_case(str)
  str.gsub(/[-_](.)/) { "#{$1.upcase}" }
  # str.split(/[_-]/).each_with_index{|w, i| w.capitalize! if i > 0}.join('')
end

# def to_camel_case(str)
  # str.split(/[_-]/).each_with_index{|w, i| w.capitalize! if i > 0}.join('')
# end
#


# You need to write regex that will validate a password to make sure it meets the following criteria:
#
# At least six characters long
# contains a lowercase letter
# contains an uppercase letter
# contains a number
# Valid passwords will only be alphanumeric characters.

regex=/\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]{6,}\z/

# Just look, don't include in match result

# (?=.*[a-z]) => look ahead: means any char followed by a downcase character => look for a downcase char
# (?=.*[A-Z]) => look ahead: means any char followed by a upcase character => look for a upcase char
# (?=.*[0-9]) => look ahead: means any char followed by a number => look for a number
# [a-zA-Z0-9]{6,} => main regex: at least 6 chars of a-zA-Z0-9 (alphanumeric)