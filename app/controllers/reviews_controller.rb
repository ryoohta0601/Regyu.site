class ReviewsController < ApplicationController

  def index
  end

  def new
    @review = Review.new
    @review.review_images.build
    @restaurant = params[:restaurant_id]
  end

  def create
    @review = Review.create(review_params)
    if @review.save!
      redirect_to review_path(@review.id)
    else
      redirect_to new_review_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :image, :day_week, :time, :number_users, :menu_items, :menu_price, :menu_numbers, :total_price, :restaurant_id).merge(user_id: current_user.id)
  end

end
