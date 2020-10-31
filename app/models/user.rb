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

  validates :profile,
  length: { maximum: 200 }

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_restaurants, through: :bookmarks, source: :restaurant

  has_many :browsing_histories, dependent: :destroy

  has_many :events, dependent: :destroy
  
  def already_liked?(review)
    self.likes.exists?(review_id: review.id)
  end

  def bookmark_by?(restaurant)
    self.bookmarks.exists?(restaurant_id: restaurant.id)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = 'ゲストユーザー'
    end
  end
end
