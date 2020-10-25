class ReviewImage < ApplicationRecord
  belongs_to :review

  mount_uploader :image, ImageUploader
end
