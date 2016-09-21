class Admin::UsersController < AdminController
  before_action :authenticate_admin!
  before_save :ensure_authentication_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /feeds
  # GET /feeds.json
  def index
    if params[:id]
      @user = User.find(params[:id])
    else
      @users = User.all
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @user = User.find(params[:id])
  end
  # GET /feeds/new
  def new  
    @user = User.new
  end

  # GET /feeds/1/edit
  def edit
    @user = User.find(params[:id]) 
  end
  # POST /feeds
  # POST /feeds.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @admin_users, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @user.update(feed_params)
        format.html { redirect_to @admin_users, notice: 'Feed was successfully updated.' }
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
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end


