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
  		ticker_response = { 
  		  :id => ticker.id, 
  		  :code => code.gsub('"',''),
  			:name => name.gsub('"',''), 
  			:date => date.gsub('"',''), 
  			:time => time.gsub('"',''), 
  			:value => Ticker.number_with_delimiter1(value.gsub('"',''), ','), 
  			:change => change.gsub('"',''), 
  			:pchange => pchange.gsub('"',''), 
  			:volume => Ticker.number_with_delimiter2(volume.gsub('"',''), ',')
  		}
  		
  		if (change.include? '-')
  		  ticker_response[:scale] = 'negative'
  		elsif (change.include? '+')
  		  ticker_response[:scale] = 'positive'
  		else
  		  ticker_response[:scale] = 'neutral'
      end

  		@tickers.push(ticker_response)
  		
  		logger.debug @tickers
  	end
  end

end
