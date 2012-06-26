
class HomeController < ApplicationController
  def index
    @users = User.all
    @ts = RoundStat.find_all_by_team(1)
    @cts = RoundStat.find_all_by_team(2)
    @round_stats = RoundStat.all
    @daily_stats = DailyStat.all
    @perma_stats = PermaStat.all
    # render 'round_stats/index'
  end
end
