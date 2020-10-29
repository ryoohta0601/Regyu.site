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
    @restaurant = params[:restaurant_id]
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to review_path(@review.id)
    else
      redirect_to new_review_path
    end
  end

  def edit
    @review = Review.find(params[:id])
    @restaurant = params[:restaurant_id]
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path, notice:"削除しました"
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :day_week, :time, :number_users, :total_price, :rate, :restaurant_id, images: []).merge(user_id: current_user.id)
  end

end
