class AddImagesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :images, :json
  end
end
