class EmailController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]

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
    params.repuire(:user).permit(:email)
  end
end
