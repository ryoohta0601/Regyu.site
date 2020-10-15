class MypagesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end
