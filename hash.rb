h = {}
h[:a]  #=> nil
h.fetch(:a) #=> KeyError: key not found: :a
h.fetch(:a, 0) #=> 0
h.fetch(:a) #=> KeyError: key not found: :a

h[:a] = 1
h.fetch(:a) #=> 1
h.fetch(:a, 0) #=> 1


