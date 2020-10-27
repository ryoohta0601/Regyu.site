class Review < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user
  belongs_to :restaurant

  validates :title, presence: true
  validates :body, presence: true
end
