class ToppagesController < ApplicationController
  def index
    @restaurants = Restaurant.all.each do |restaurant|
      restaurant.average = restaurant.average_rate
    end

    @restaurants = @restaurants.sort_by { |restaurant| [restaurant.average ? 1 : 0, restaurant.average] }.reverse

    @reviews = Review.all.order(created_at: :desc).limit(6)
  end
end
