class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :images
      t.string :restaurant_name
      t.string :day_week
      t.integer :time
      t.integer :number_users
      t.integer :total_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
