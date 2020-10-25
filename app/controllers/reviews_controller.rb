class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc).limit(5)
  end

  def show
    @review = Review.find(params[:id])
    @restaurant = params[:restaurant_id]
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
    params.require(:review).permit(:title, :body, :image, :day_week, :time, :number_users, :total_price, :restaurant_id).merge(user_id: current_user.id)
  end

end
