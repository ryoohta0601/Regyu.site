class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:review, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def review
    @reviews = Review.where(user_id: params[:id]).order(created_at: :desc).limit(5)
  end

  def bookmark
    @bookmark = Bookmark.where(user_id: params[:id])
    @bookmarks = @bookmark.includes(:restaurant).order(created_at: :desc).limit(5)
  end

  def show
    @reviews = Review.where(user_id: params[:id]).order(created_at: :desc).limit(5)
    @review= Review.where(user_id: params[:id])
    @like = Like.where(user_id: params[:id])
    @bookmark = Bookmark.where(user_id: params[:id])
    @bookmarks = @bookmark.includes(:restaurant).order(created_at: :desc).limit(5)
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  
  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:username, :email, :profile, :img, :remove_img)
  end

end
