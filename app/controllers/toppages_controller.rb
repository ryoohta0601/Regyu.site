class ToppagesController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: :desc).limit(6)
  end
end
