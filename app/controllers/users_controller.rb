
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_url_name(params[:url_name])
    redirect_to users_url, :alert => "User doesn't exist or wrong url_name" unless @user
  end
end
