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
DailyStat.delete_all
PermaStat.delete_all
#RoundStat.create(:name => "Shep", :setinfo_pass => "abcd", :kills => 1000, :deaths => 50, :hits => 1000, :shots => 100000, :headshots => 10)
#55.times { RoundStat.create(:name => rand_string, :setinfo_pass => rand_string, :kills => rand(1000), :deaths => 50+rand(1000), :hits => rand(10000), :shots => rand(10000), :headshots => rand(100)) }

User.delete_all
#puts 'SETTING UP DEFAULT USER LOGIN'
pass = rand_string
55.times { user = User.create! :name => rand_string, :setinfo_pass => rand_string, :email => rand_string + "@gmail.com", :password => pass, :password_confirmation => pass }

@perma_stats = PermaStat.all

@perma_stats.each do |row|
  row.kills = rand(1000)
  row.deaths = rand(1000)
  row.hits = rand(1000)
  row.headshots = rand(1000)
  row.shots = rand(1000)
end

@daily_stats = DailyStat.all

@daily_stats.each do |row|
  row.kills = rand(1000)
  row.deaths = rand(1000)
  row.hits = rand(1000)
  row.headshots = rand(1000)
  row.shots = rand(1000)
end
#puts 'New user created: ' << user.name
#user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user2.name

5.times { RoundStat.create(:name => rand_string, :setinfo_pass => rand_string, :kills => rand(10), :deaths => rand(10), :hits => rand(100), :shots => rand(1000), :headshots => rand(10), :team => 1) }

5.times { RoundStat.create(:name => rand_string, :setinfo_pass => rand_string, :kills => rand(10), :deaths => rand(10), :hits => rand(100), :shots => rand(1000), :headshots => rand(10), :team => 2) }

