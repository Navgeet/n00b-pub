class HomeController < ApplicationController
  def index

    require 'gchart'
    map_hash = File.read("/home/nav/cs/cstrike/map_log").split.inject(Hash.new(0)) { |h,e| id, n = e.split('-'); h[id] += n.to_i; h } 
    @map_names = Array.new 
    @map_times = Array.new 

    map_hash.each do |key, value| 
      @map_names << key 
      @map_times << value 
    end 

    @pie_chart = Gchart.pie(:title => 'Map frequency', :size => '600x420', :data => @map_times, :labels => @map_names )

    flash.now[:alert] = "Please note that the site is in beta stage. <a href=\"/bugs\">Help out</a> by reporting bugs and suggesting enhancements.".html_safe
    flash.now[:notice] = "New here? Read this if you are <a href=\"/faq\">getting started</a>.".html_safe
    flash.now[:tip] = "Tip: Login and check \"Remember Me\" to get rid of these messages.".html_safe

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
    # render 'round_stats/index'
  end
end
