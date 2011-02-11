class HomeController < ApplicationController
  
	require 'net/http'
  require 'uri'
  require 'ostruct'
	
	def index
		ttickers = Ticker.all
		app_uri = URI.parse('http://download.finance.yahoo.com/d/quotes.csv')
  	@tickers = []
  	
  	ttickers.each do |ticker|
  		params = {:s => ticker.code, :f => ticker.format}	
  		fullname1, name, index, date, time, change, pchange = Net::HTTP.post_form(app_uri, params).body.chomp.split(',')
  		ticker_response = { :id => ticker.id, :fullname1 => fullname1.gsub('"',''),
  			:name => name.gsub('"',''), :index => index.gsub('"',''), :date => date.gsub('"',''),
  			:time => time.gsub('"',''), :change => change.gsub('"',''), :pchange => pchange.gsub('"','') }
  		@tickers.push(ticker_response)
  	end
  end

end
