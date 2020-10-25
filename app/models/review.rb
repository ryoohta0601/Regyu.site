class Review < ApplicationRecord

  belongs_to :user
  belongs_to :restaurant

  has_many :review_images, dependent: :destroy
  accepts_nested_attributes_for :review_images

  validates :title, presence: true
  validates :body, presence: true
end
