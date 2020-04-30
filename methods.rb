"abcde"[1] == "abcde".[](1)

2 + 2 == 2.+(2)

class UserRepository
  def initialize
    @users = ['Peter', 'James', 'Luke']
  end

  # we are just delegating the [] method
  def [](idx)
    @users[idx]
  end
end

users = UserRepository.new
puts users[0] # Output: Peter
puts users.[](1) # Output: James
