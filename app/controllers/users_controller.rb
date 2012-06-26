
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @user = User.find(:all, :name => params[:name])
    # @user = User.find(:all, :conditions => [ "name = ?", params[:name]])
    @user = User.find_by_name(params[:name])
  end
end
