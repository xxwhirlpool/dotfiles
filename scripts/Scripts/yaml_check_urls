#!/usr/bin/env ruby
#
# ping the URLs in my site's blogroll & see if they're alive
# only run this once in a while ig

require "yaml"
require "net/http"
require "uri"

yml = YAML.load_file("/home/kat/Projects/mine/eunoia-astro/src/content/blogroll/blogs.yml")

yml.each do |y|
	uri = URI(y["url"])

	begin
		res = Net::HTTP.get_response(uri)
		case res.code.to_i
			when 200
				puts "success: #{uri}"
			else
				res.code
			end
		rescue SocketError, OpenSSL::SSL::SSLError, Net::ReadTimeout, Net::OpenTimeout => e
			puts "error: #{uri} - #{e}"
		end
end

