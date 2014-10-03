require 'net/http'

url = URI("")

Net::HTTP.get(url)
