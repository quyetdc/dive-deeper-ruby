require 'csv'

csv_without_headers = CSV.read("csv-example.csv")
puts csv_without_headers.to_s

csv_with_headers =  CSV.read("csv-example.csv", headers: true )
puts csv_with_headers.to_s
puts csv_with_headers.class

hash_data = Hash.new
hash_data = csv_with_headers.each { |row| { "#{row['name']}": { age: row['age'] } }   }
p hash_data