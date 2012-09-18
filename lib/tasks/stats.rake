# coding: utf-8

namespace :stats do
  desc "updates the file ~/average_player_count_log"
  task :generate_average_graph_data => :environment do
    todays_count_array = File.read("/home/nav/player_count_log").split(" ").map(&:to_i)
    average_count_array = File.read("/home/nav/average_player_count_log").split(" ").map(&:to_i)
    no_of_days = average_count_array.pop
    new_average_array = average_count_array.each_with_index.map { |x, i| (x * no_of_days + todays_count_array[i]) / (no_of_days + 1) }
    out = new_average_array.join(" ") + " #{no_of_days + 1}"
    File.open("/home/nav/average_player_count_log", 'w') { |f| f.write(out) }
  end
    
  desc "counts the times for each map and creates a new file with total time for the map"
  task :reduce_map_times_file do
    @map_hash = File.read("/home/nav/cs/cstrike/map_log").downcase.split.inject(Hash.new(0)) { |h,e| id, n = e.split('-'); h[id] += n.to_i; h }
    File.open("/home/nav/cs/cstrike/map_log.new", 'w') do |f|
      @map_hash.each do |map, time|
        f.puts "#{map}-#{time}"
      end
    end
  end
end
