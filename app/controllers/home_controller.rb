class HomeController < ApplicationController
  def index

    # This builds up the player_count line chart
    @player_count_array = File.read("/home/nav/player_count_log").split(" ").map(&:to_i)
    @average_count_array = File.read("/home/nav/average_player_count_log").split(" ").map(&:to_i)
    @average_count_array.pop

    # This builds up the map_frequency pie chart
    @map_hash = File.read("/home/nav/cs/cstrike/map_log").downcase.split.inject(Hash.new(0)) { |h,e| id, n = e.split('-'); h[id] += n.to_i; h } 
    @map_names = @map_hash.keys
    @map_times = @map_hash.values

    # This provides the current map and the time it has been running
    mp = File.read("/home/nav/cs/cstrike/current_map").split(" ")
    @map_name = mp[0]
    @map_time_started = Time.local(mp[4], mp[5], mp[6], mp[1], mp[2], mp[3])

    # The messages which appear on the top of home page
    flash.now[:alert] = "Please note that the site is in beta stage. <a href=\"/bugs\">Help out</a> by reporting bugs and suggesting enhancements.".html_safe
    flash.now[:notice] = "New here? Read this if you are <a href=\"/faq\">getting started</a>.".html_safe
    flash.now[:tip] = "Tip: Login and check \"Remember Me\" to get rid of these messages.".html_safe

    # Make the flash messages dissapear if the user is logged in
    if user_signed_in?
      flash.now[:alert] = nil
      flash.now[:notice] = nil
      flash.now[:tip] = nil
    end

    @users = User.all
    @ts = RoundStat.find_all_by_team(1)
    @cts = RoundStat.find_all_by_team(2)
    @round_stats = RoundStat.all
    @daily_stats = DailyStat.all
    @perma_stats = PermaStat.all
  end
end
