class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like

  def create
    @like = current_user.likes.create(review_id: params[:review_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(review_id: params[:review_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_like
    @review = Review.find(params[:review_id])
  end
end
