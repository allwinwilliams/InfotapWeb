class FeedsController < ApplicationController  
  def index
    @feeds = Feed.all
    @feed = Feed.find_by(id: params[:id])
  end
  def show
    @feed = Feed.find_by(id: params[:id])
    unless @feed
      render status: 404, nothing: true
    end
  end
  def new
    @feed = Feed.new
  end
  def edit
    @feed = Feed.find_by(id: params[:id])
    unless @feed
      render status: 404, nothing: true
    end
  end
  def create
  end
  def update
    @feed = Feed.find_by(id: params[:id])
    unless @feed
      render status: 404, nothing: true
    end
  end
  def destroy
    @feed = Feed.find_by(id: params[:id])
    unless @feed
      render status: 404, nothing: true
    end    
  end
end
