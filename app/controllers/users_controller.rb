
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_url_name(params[:url_name])
  end
end
