# coding: utf-8

namespace :stats do
  desc "reads the file ~/player_count_log and generates today's player count graph"
    task :generate_graph => :environment do
      require 'gchart'
      daily_player_count = File.read("/home/nav/player_count_log").split(" ").map(&:to_i)
      sh "wget -c -O /home/nav/n00b-pub/public/player_count_chart.jpg \"#{Gchart.line(:title => "Player count", :data => daily_player_count, :size => '600x460', :axis_with_labels => 'y', :axis_labels => (0..24).to_a.map(&:to_s), :encoding => 'text')}\""
      #Gchart.line(:title => "Player count", :data => daily_player_count, :size => '600x460', :axis_with_labels => 'y', :axis_labels => (0..24).to_a.map(&:to_s), :format => 'file', :filename => '/home/nav/n00b-pub/public/player_count_chart.jpg')
      sh "wget -c -O /home/nav/n00b-pub/public/player_count_chart_thumb.jpg \"#{Gchart.line(:title => "Player count", :data => daily_player_count, :size => '200x130')}\""
    end
    
  desc "deletes the previous player_count_log file"
    task :flush_player_count do
    File.delete("/home/nav/player_count_log") if File.exist?("/home/nav/player_count_log")
  end
end