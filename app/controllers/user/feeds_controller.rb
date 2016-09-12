class FeedsController < UserController
  before_action :authenticate_user!
  before_action :set_feed, only: [:show, :edit, :update, :destroy]


  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show

    @feed = Feed.find(params[:id])
  end
  # GET /feeds/new
  

  # GET /feeds/1/edit
 
  
 

  # POST /feeds
  # POST /feeds.json
  


  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
 
  # DELETE /feeds/1
  # DELETE /feeds/1.json
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:title, :description, :department_id)
    end
end

