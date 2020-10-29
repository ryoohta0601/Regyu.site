class BookmarksController < ApplicationController

  before_action :set_restaurant

  def create
    @bookmark = Bookmark.create(user_id: current_user.id,restaurant_id: params[:restaurant_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, restaurant_id: params[:restaurant_id])
    @bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
