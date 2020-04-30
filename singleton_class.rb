
str = "test"
def str.show
  puts self
end
p str.singleton_methods # => [:show]

class Animal
  def self.test
  end
end
p Animal.singleton_methods
p Animal.singleton_class ##<Class:Animal>


# What's the output?
#
class Animal

  # class-level methods you define them on the singleton class
  # A singleton class also allows you to define methods that only exist in a single,
  # original class, without altering
  #
  class << self
    def run
    end
    def eat
    end
  end

end
p Animal.singleton_methods #[:run, :test, :eat]
