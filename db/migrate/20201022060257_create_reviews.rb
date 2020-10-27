class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :day_week
      t.string :time
      t.string :number_users
      t.integer :total_price
      t.string :restaurant_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
