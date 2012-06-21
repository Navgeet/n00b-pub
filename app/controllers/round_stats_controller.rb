
class RoundStatsController < ApplicationController
  # GET /round_stats
  # GET /round_stats.json
  def index
   @round_stats = RoundStat.all
   # 
   # respond_to do |format|
   #   format.html # index.html.erb
   #   format.json { render json: @round_stats }
   # end

    respond_to do |format|
      format.html
      format.json { render json: RoundStatsDatatable.new(view_context) }
    end
  end

  # GET /round_stats/1
  # GET /round_stats/1.json
  def show
    @round_stat = RoundStat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round_stat }
    end
  end

  # GET /round_stats/new
  # GET /round_stats/new.json
  def new
    @round_stat = RoundStat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @round_stat }
    end
  end

  # GET /round_stats/1/edit
  def edit
    @round_stat = RoundStat.find(params[:id])
  end

  # POST /round_stats
  # POST /round_stats.json
  def create
    @round_stat = RoundStat.new(params[:round_stat])

    respond_to do |format|
      if @round_stat.save
        format.html { redirect_to @round_stat, notice: 'Round stat was successfully created.' }
        format.json { render json: @round_stat, status: :created, location: @round_stat }
      else
        format.html { render action: "new" }
        format.json { render json: @round_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /round_stats/1
  # PUT /round_stats/1.json
  def update
    @round_stat = RoundStat.find(params[:id])

    respond_to do |format|
      if @round_stat.update_attributes(params[:round_stat])
        format.html { redirect_to @round_stat, notice: 'Round stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @round_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /round_stats/1
  # DELETE /round_stats/1.json
  def destroy
    @round_stat = RoundStat.find(params[:id])
    @round_stat.destroy

    respond_to do |format|
      format.html { redirect_to round_stats_url }
      format.json { head :no_content }
    end
  end
end
