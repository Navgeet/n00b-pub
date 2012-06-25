
class PermaStatsController < ApplicationController
  # GET /perma_stats
  # GET /perma_stats.json
  def index
    @perma_stats = PermaStat.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @perma_stats }
    # end

    respond_to do |format|
      format.html
      format.json { render json: PermaStatsDatatable.new(view_context) }
    end
  end

  # GET /perma_stats/1
  # GET /perma_stats/1.json
  def show
    @perma_stat = PermaStat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @perma_stat }
    end
  end

  # GET /perma_stats/new
  # GET /perma_stats/new.json
  def new
    @perma_stat = PermaStat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @perma_stat }
    end
  end

  # GET /perma_stats/1/edit
  def edit
    @perma_stat = PermaStat.find(params[:id])
  end

  # POST /perma_stats
  # POST /perma_stats.json
  def create
    @perma_stat = PermaStat.new(params[:perma_stat])

    respond_to do |format|
      if @perma_stat.save
        format.html { redirect_to @perma_stat, notice: 'Perma stat was successfully created.' }
        format.json { render json: @perma_stat, status: :created, location: @perma_stat }
      else
        format.html { render action: "new" }
        format.json { render json: @perma_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /perma_stats/1
  # PUT /perma_stats/1.json
  def update
    @perma_stat = PermaStat.find(params[:id])

    respond_to do |format|
      if @perma_stat.update_attributes(params[:perma_stat])
        format.html { redirect_to @perma_stat, notice: 'Perma stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perma_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perma_stats/1
  # DELETE /perma_stats/1.json
  def destroy
    @perma_stat = PermaStat.find(params[:id])
    @perma_stat.destroy

    respond_to do |format|
      format.html { redirect_to perma_stats_url }
      format.json { head :no_content }
    end
  end
end
