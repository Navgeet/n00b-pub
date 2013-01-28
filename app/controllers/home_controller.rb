class HomeController < ApplicationController
  def index

    # This builds up the player_count line chart
    @player_count_array = File.read("/home/nav/player_count_log").split(" ").map(&:to_i)
    @average_count_array = File.read("/home/nav/average_player_count_log").split(" ").map(&:to_i)
    @average_count_array.pop

    require 'tod'
    t = TimeOfDay.new(6)
    @line_data_string = ""
    @player_count_array.fill("null", @player_count_array.count, 720-@player_count_array.count)
    @player_count_array.zip(@average_count_array).each do |c, a|
      @line_data_string << "['#{t.strftime("%I:%M %p")}', #{c}, #{a}],"
      t = t + 120
    end

    # This builds up the map_frequency pie chart
    @pie_data_string = Map.get_pie_chart_data

    @map_name = Map.current_map_name
    @map_time_started = Map.current_map_time_started

    # The messages which appear on the top of home page
    flash.now[:notice] = "New here? Read this if you are <a href=\"/faq\">getting started</a>.".html_safe
    
    # Make the flash messages dissapear if the user is logged in
    if user_signed_in?
      flash.now[:alert] = nil
      flash.now[:notice] = nil
      flash.now[:tip] = nil
    end

    @ts = RoundStat.find_all_by_team(1)
    @cts = RoundStat.find_all_by_team(2)
    @round_stats = RoundStat.all
    @daily_stats = DailyStat.all
    @perma_stats = PermaStat.all

  end

  def ajax
    @no_of_players = RoundStat.all.count
    @map_name = Map.current_map_name
    @map_time_started = Map.current_map_time_started

    @title = "#{@no_of_players}/24 - #{@map_name}"

    @ts = RoundStat.find_all_by_team(1)
    @cts = RoundStat.find_all_by_team(2)

  end
end
