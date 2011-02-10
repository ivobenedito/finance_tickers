class CreateTickers < ActiveRecord::Migration
  def self.up
    create_table :tickers do |t|
      t.string :code
      t.string :format

      t.timestamps
    end
  end

  def self.down
    drop_table :tickers
  end
end
