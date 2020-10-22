class Restaurant < ApplicationRecord
  mount_uploader :img, ImgUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
