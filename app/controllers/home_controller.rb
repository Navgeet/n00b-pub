
class HomeController < ApplicationController
  def index
    @users = User.all
    @round_stats = RoundStat.all
    # render 'round_stats/index'
  end
end
