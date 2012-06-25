
class HomeController < ApplicationController
  def index
    @users = User.all
    @round_stats = RoundStat.all
    @daily_stats = DailyStat.all
    @perma_stats = PermaStat.all
    # render 'round_stats/index'
  end
end
