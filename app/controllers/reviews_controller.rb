class ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review.id)
    else
      redirect_to new_review_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :images, :restaurant_name, :day_week, :time, :number_users, :menu_items, :menu_price, :menu_numbers, :total_price, :user)
  end

end
