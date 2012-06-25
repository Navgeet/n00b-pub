
class DailyStatsController < ApplicationController
  # GET /daily_stats
  # GET /daily_stats.json
  def index
    @daily_stats = DailyStat.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @daily_stats }
  #  end
    respond_to do |format|
      format.html
      format.json { render json: DailyStatsDatatable.new(view_context) }
    end
  end

  # GET /daily_stats/1
  # GET /daily_stats/1.json
  def show
    @daily_stat = DailyStat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_stat }
    end
  end

  # GET /daily_stats/new
  # GET /daily_stats/new.json
  def new
    @daily_stat = DailyStat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_stat }
    end
  end

  # GET /daily_stats/1/edit
  def edit
    @daily_stat = DailyStat.find(params[:id])
  end

  # POST /daily_stats
  # POST /daily_stats.json
  def create
    @daily_stat = DailyStat.new(params[:daily_stat])

    respond_to do |format|
      if @daily_stat.save
        format.html { redirect_to @daily_stat, notice: 'Daily stat was successfully created.' }
        format.json { render json: @daily_stat, status: :created, location: @daily_stat }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /daily_stats/1
  # PUT /daily_stats/1.json
  def update
    @daily_stat = DailyStat.find(params[:id])

    respond_to do |format|
      if @daily_stat.update_attributes(params[:daily_stat])
        format.html { redirect_to @daily_stat, notice: 'Daily stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_stats/1
  # DELETE /daily_stats/1.json
  def destroy
    @daily_stat = DailyStat.find(params[:id])
    @daily_stat.destroy

    respond_to do |format|
      format.html { redirect_to daily_stats_url }
      format.json { head :no_content }
    end
  end
end
