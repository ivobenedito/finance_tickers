class HomeController < ApplicationController
  
	require 'net/http'
  require 'uri'
	
	def index
  	app_uri = URI.parse('http://download.finance.yahoo.com/d/quotes.csv')
  	params = {'s' => '^GSPC', 'f' => 'sl1d1t1c1p2'}
  	@fullname, @name, @index, @date, @time, @change, @pchange = Net::HTTP.post_form(app_uri, params).body.chomp.split(',')
  end

end
