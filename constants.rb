# What's constants: Anything starting with a captial letter, except method names
# Class names are constants that's why you can access core classes from anywhere


module Foo
  X = 10
  class Bar
    # The constant lookup will be done in this order:
    #
    # [Foo::Bar, Foo, Foo::Bar, Object, Kernel, BasicObject]
    #
    puts X
  end
end