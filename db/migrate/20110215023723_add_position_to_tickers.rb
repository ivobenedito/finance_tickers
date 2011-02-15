class AddPositionToTickers < ActiveRecord::Migration
  def self.up
    add_column :tickers, :position, :integer
  end

  def self.down
    remove_column :tickers, :position
  end
end
