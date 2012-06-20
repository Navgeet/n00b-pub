# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RoundStat.delete_all
RoundStat.create(:name => "Shep", :setinfo_pass => "abcd", :kills => 100, :deaths => 50, :hits => 1000, :shots => 100000, :headshots => 10)
RoundStat.create(:name => "foo", :setinfo_pass => "efgh", :kills => -1, :deaths => 500, :hits => 1000, :shots => 100000, :headshots => 10)
