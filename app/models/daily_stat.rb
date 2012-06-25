class DailyStat < ActiveRecord::Base
  attr_accessible :deaths, :headshots, :hits, :kills, :name, :setinfo_pass, :shots
end
