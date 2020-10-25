class CreateReviewImages < ActiveRecord::Migration[6.0]
  def change
    create_table :review_images do |t|

      t.string :image_url
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
