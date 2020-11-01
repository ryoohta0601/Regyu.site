class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all.order(created_at: :desc).page(params[:page]).per(6)
    if user_signed_in?
      @browsing_histories = BrowsingHistory.where(user_id: current_user.id).order(created_at: :desc).limit(10)
    end
  end

  def show
    @reviews = Review.where(restaurant_id: params[:id]).order(created_at: :desc).limit(5)
    @bookmark = Bookmark.new
    new_history = @restaurant.browsing_histories.new
    new_history.user_id = current_user.id
    if current_user.browsing_histories.exists?(restaurant_id: "#{params[:id]}")
      old_history = current_user.browsing_histories.find_by(restaurant_id: "#{params[:id]}")
      old_history.destroy
    end
    new_history.save
    histories_stock_limit = 5
    histories = current_user.browsing_histories.all
    if histories.count > histories_stock_limit
      histories[0].destroy
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      redirect_to new_restaurant_path
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :img, :prefecture_id, :latitude, :longitude)
  end
end
