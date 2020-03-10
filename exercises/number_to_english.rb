# Write a method that takes a number and returns a string of that number in English. For example
#
# number_to_english(27) # => 'twenty seven'
# Your method should be able to handle any number between 0 and 99999.
# If given numbers outside of that range or non-Integer numbers, the method should return an empty string

def number_to_english(n)
  return "" unless n.integer? && n >= 0

  numbers_to_name = {
    1000000 => "million",
    1000 => "thousand",
    100 => "hundred",
    90 => "ninety",
    80 => "eighty",
    70 => "seventy",
    60 => "sixty",
    50 => "fifty",
    40 => "forty",
    30 => "thirty",
    20 => "twenty",
    19=>"nineteen",
    18=>"eighteen",
    17=>"seventeen",
    16=>"sixteen",
    15=>"fifteen",
    14=>"fourteen",
    13=>"thirteen",
    12=>"twelve",
    11 => "eleven",
    10 => "ten",
    9 => "nine",
    8 => "eight",
    7 => "seven",
    6 => "six",
    5 => "five",
    4 => "four",
    3 => "three",
    2 => "two",
    1 => "one",
    0 => "zero"
  }

  if n < 10
    numbers_to_name[n]
  elsif n < 100
    if n % 10 == 0 || n < 20
      numbers_to_name[n]
    else
      numbers_to_name[(n / 10) * 10] + ' ' + numbers_to_name[(n % 10)]
    end
  elsif n < 1000
    if n % 100 == 0
      numbers_to_name[(n / 100)] + ' ' + numbers_to_name[100]
    else
      numbers_to_name[(n / 100)] + ' ' + numbers_to_name[100] + ' ' + number_to_english(n % 100)
    end
  elsif n <= 99999
    number_to_english(n / 1000) + ' ' + numbers_to_name[1000] + ' ' + number_to_english(n % 1000)
  else
    ""
  end

end