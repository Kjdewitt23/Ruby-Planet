puts "Hello World!"
require 'net/https'

# download the data
uri = URI.parse("https://gist.githubusercontent.com/joelbirchler/66cf8045fcbb6515557347c05d789b4a/raw/9a196385b44d4288431eef74896c0512bad3defe/exoplanets")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
response = http.get(uri.request_uri)

# print the data to the screen
# puts response.body

require 'json'

my_hash = JSON.parse(response.body)
#puts my_hash[0]['HostStarTempK']
x = -1
y = ""
for i in 0..my_hash.size-1 do
  puts my_hash[i]['HostStarTempK']
	if my_hash[i]['HostStarTempK'] != ""
		if my_hash[i]['HostStarTempK'] > x 
		x = my_hash[i]['HostStarTempK']
		y = my_hash[i]['PlanetIdentifier']
		end
	end
end

puts x
puts y