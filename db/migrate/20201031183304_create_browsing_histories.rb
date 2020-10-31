class CreateBrowsingHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :browsing_histories do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
