# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Ticker.delete_all
Ticker.create!(:position => 1, :code => 'SSBR3.SA', :code_bloomberg => 'SSBR3.BZ', :format => 'snd1t1l1c1p2v')
Ticker.create!(:position => 2, :code => '^BVSP'   , :code_bloomberg => 'IBOV:IND', :format => 'snd1t1l1c1p2v')
Ticker.create!(:position => 3, :code => 'BRML3.SA', :code_bloomberg => 'BRML3.BZ', :format => 'snd1t1l1c1p2v')
Ticker.create!(:position => 3, :code => 'MULT3.SA', :code_bloomberg => 'MULT3.BZ', :format => 'snd1t1l1c1p2v')
Ticker.create!(:position => 3, :code => 'IGTA3.SA', :code_bloomberg => 'IGTA3.BZ', :format => 'snd1t1l1c1p2v')
Ticker.create!(:position => 3, :code => 'ALSC3.SA', :code_bloomberg => 'ALSC3.BZ', :format => 'snd1t1l1c1p2v')