
class BugsController < ApplicationController

def new
end

def create
  @bug = Bug.new(params[:bug])
  @bug.save
  redirect_to :action => :show, :id => @bug.id
end

def show
  @bug = Bug.find(params[:id])
end

def index
  @bugs = Bug.all
end

end
