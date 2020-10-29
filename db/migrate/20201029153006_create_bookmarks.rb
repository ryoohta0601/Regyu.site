class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
      t.index [:restaurant_id, :user_id], unique: true
    end
  end
end
