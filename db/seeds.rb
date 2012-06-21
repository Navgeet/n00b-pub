# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def rand_string
  (0...10).map{ ('a'..'z').to_a[rand(26)] }.join
end

RoundStat.delete_all
RoundStat.create(:name => "Shep", :setinfo_pass => "abcd", :kills => 1000, :deaths => 50, :hits => 1000, :shots => 100000, :headshots => 10)
55.times { RoundStat.create(:name => rand_string, :setinfo_pass => rand_string, :kills => rand(1000), :deaths => 50+rand(1000), :hits => rand(10000), :shots => rand(10000), :headshots => rand(100)) }
