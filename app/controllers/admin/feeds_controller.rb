class Admin::FeedsController < AdminController
  before_action :authenticate_admin!
  before_action :set_feed, only: [:new, :create, :show, :edit, :update, :destroy]

  # GET /feeds
  # GET /feeds.json
  def index
    if params[:id]
      @feed = Feed.find(params[:id])
    elsif params[:department_id]
      @department=Department.find(params[:department_id])
      @feeds = Feed.all.order({ updated_at: :desc })
    elsif params[:q]
        @feeds=Feed.search(params[:q])
    else
      @feeds = Feed.all.order({ updated_at: :desc })
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @feed = Feed.find(params[:id])
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
    @departments = Department.all.order({ updated_at: :desc })
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
    @departments = Department.all.order({ updated_at: :desc })
  end

  def show_departments
    @department=Department.find(params[:id])
    @feeds = Feed.all.order({ updated_at: :desc })
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)
    respond_to do |format|
      if @feed.save
        format.html { redirect_to admin_feeds_path, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        @departments=Department.all.order({ updated_at: :desc })
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    @feed = Feed.find(params[:id])
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to admin_feeds_path, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to admin_feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      #@feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:title, :description, :department_id)
    end

end
