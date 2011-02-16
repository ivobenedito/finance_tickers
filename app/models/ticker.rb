class Ticker < ActiveRecord::Base
  
  def self.number_with_delimiter1(number, delimiter=",")
    number = '%.2f' % number
    number.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
  end

  def self.number_with_delimiter2(number, delimiter=",")
    number.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
  end

  
end
