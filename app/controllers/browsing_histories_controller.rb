class BrowsingHistoriesController < ApplicationController
  def index
    @browsing_histories = BrowsingHistory.where(user_id: current_user.id).order(created_at: :desc).limit(10)
  end
end
