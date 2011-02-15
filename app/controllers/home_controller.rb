class HomeController < ApplicationController
  
	require 'net/http'
  require 'uri'
  require 'ostruct'
	
	def index
		ttickers = Ticker.order('position ASC')
		app_uri = URI.parse('http://download.finance.yahoo.com/d/quotes.csv')
  	@tickers = []
  	
  	ttickers.each do |ticker|
  		params = {:s => ticker.code, :f => ticker.format}	
  		code, name, date, time, value, change, pchange, volume = Net::HTTP.post_form(app_uri, params).body.chomp.split(',')
  		ticker_response = { :id => ticker.id, :code => code.gsub('"',''),
  			:name => name.gsub('"',''), :date => date.gsub('"',''), :time => time.gsub('"',''), :value => value.gsub('"',''), 
  			:change => change.gsub('"',''), :pchange => pchange.gsub('"',''), :volume => volume.gsub('"','') }
  		@tickers.push(ticker_response)
  	end
  end

end
