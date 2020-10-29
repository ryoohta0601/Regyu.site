class RanksController < ApplicationController

  def index
    @users = User.find(Review.group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))

    @restaurants = Restaurant.all.each do |restaurant|
      restaurant.average = restaurant.average_rate
    end

    @restaurants = @restaurants.sort_by { |restaurant| [restaurant.average ? 1 : 0, restaurant.average]}.reverse
    end

end
