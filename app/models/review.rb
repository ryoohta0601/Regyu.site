class Review < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user
  belongs_to :restaurant

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true
  validates :body, presence: true

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
