class Restaurant < ApplicationRecord
  mount_uploader :img, ImgUploader
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
