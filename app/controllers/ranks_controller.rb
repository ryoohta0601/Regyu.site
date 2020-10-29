class RanksController < ApplicationController

  def index
    @restaurants = Restaurant.all.each do |restaurant|
      restaurant.average = restaurant.average_rate
    end

   @restaurants = @restaurants.sort_by { |restaurant| [restaurant.average ? 1 : 0, restaurant.average]}.reverse
  end

end
