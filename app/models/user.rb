class User < ApplicationRecord
  mount_uploader :img, ImgUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: :false },
    length: { minimum: 4, maximum: 20 }
end
