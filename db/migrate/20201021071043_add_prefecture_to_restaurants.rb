class AddPrefectureToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :prefecture, :integer, null: false
  end
end
