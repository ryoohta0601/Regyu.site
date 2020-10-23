class Review < ApplicationRecord
  mount_uploaders :image, ImageUploader

  belongs_to :user
  belongs_to :restaurant
end
