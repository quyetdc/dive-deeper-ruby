h = {}
h[:a]  #=> nil
# h.fetch(:a) #=> KeyError: key not found: :a
h.fetch(:a, 0) #=> 0
# h.fetch(:a) #=> KeyError: key not found: :a

h[:a] = 1
h.fetch(:a) #=> 1
h.fetch(:a, 0) #=> 1

class UrlFetcher
  attr_reader :config

  def initialize(url, options = {})
    @config = {
      url: url,
      port: 80,
      verb: "get",
      protocol: 'http'
    }

    @config.merge! options
  end
end

fetcher = UrlFetcher.new('example.com', { port: 8080 })
p fetcher.config

the_hash = {
  user: {
    name: "Peter",
    country: "UK",
    age: 30
  }
}
p the_hash.fetch(:user).fetch(:name)
# p the_hash[:no_key].fetch(:name) # error: no fetch for nil
# p the_hash.fetch(:no_key).fetch(:name) # error: no key no_key

p the_hash.dig(:user, :country) # "UK"
p the_hash.dig(:something, :country) # nil

#SET
require 'set'
a = Set.new
a<<1 #<Set: {1}>
a<<1 #<Set: {1}>
a<<2 #<Set: {1, 2}>

b = Set.new
b<<1 #<Set: {1}>
b<<3 #<Set: {1, 3}>

p a ##<Set: {1, 2}>
p a.merge b #<Set: {1, 2, 3}>

a << b #<Set: {1, 2, 3, #<Set: {1, 3}>}>
p a.flatten #<Set: {1, 2, 3}>
p a.include? 2

