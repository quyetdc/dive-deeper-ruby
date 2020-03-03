
begin
  p (0..15).to_a
  p ('a'..'z').to_a
  p (Time.now..Time.now + 60).to_a
rescue TypeError => e
  p e.message
end


p (0..15).include? 15
p (0..15).include? 0
p (0...15).include? 0
p (0...15).include? 15 # false, cause 0...15 => [1, 2, 3, ..., 13, 14]

p rand(0..15)

p (0..15).step(2).map { |e| e * 3  }.to_s
p (0..15).step(2).inject(:+) # 0 + 2 + 4 + 6 + 8 + 10 + 12 + 14 = 56