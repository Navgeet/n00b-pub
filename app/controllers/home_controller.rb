
class HomeController < ApplicationController
  def index
    flash.alert = "Please note that the site is in beta stage. <a href=\"/bugs\">Help out</a> by reporting bugs and suggesting enhancements. Also note that current accounts are temporary and may be lost.".html_safe
    flash.notice = "New here? Read this if you are <a href=\"/faq\">getting started</a>.".html_safe
    flash[:tip] = "Tip: Login and check \"Remember Me\" to get rid of these messages.".html_safe
    @users = User.all
    @ts = RoundStat.find_all_by_team(1)
    @cts = RoundStat.find_all_by_team(2)
    @round_stats = RoundStat.all
    @daily_stats = DailyStat.all
    @perma_stats = PermaStat.all
    # render 'round_stats/index'
  end
end
