require 'net/http'

uri = URI('http://launch-pairs.herokuapp.com/profile/1')

homepage = Net::HTTP.get(uri)
puts homepage
