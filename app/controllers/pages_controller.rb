class PagesController < ApplicationController
  def index
    if current_user
      redirect_to user_feeds_url
      puts "redirecting............."
      puts user_feeds_url
    end
  end
end
