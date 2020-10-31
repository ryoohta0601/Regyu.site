class Restaurant < ApplicationRecord
  mount_uploader :img, ImgUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true
  validates :prefecture, presence: true
  validates :address, presence: true

  has_many :reviews

  has_many :bookmarks, dependent: :destroy

  has_many :browsing_histories, dependent: :destroy

  attr_accessor :average

  def average_rate
    self.reviews.average(:rate) 
  end
end
