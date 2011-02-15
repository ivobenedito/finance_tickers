class AddCodeBloombergToTickers < ActiveRecord::Migration
  def self.up
    add_column :tickers, :code_bloomberg, :string
  end

  def self.down
    remove_column :tickers, :code_bloomberg
  end
end
