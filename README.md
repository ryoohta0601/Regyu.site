# Design DataBase scheme

## Users
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
|reset_password_token|string||
|reset_password_sent_at|datetime||
|remember_created_at|datetime||
|profile|text||
|img|string||
### Association
- has_many :reviews, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_reviews
- has_many :bookmarks, dependent: :destroy
- has_many :bookmark_restaurants
- has_many :browsing_histories, dependent: :destroy
- has_many :events, dependent: :destroy


## Reviews
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|day_week|string||
|time|string||
|number_users|string||
|total_price|integer||
|restaurant_id|string||
|user_id|bigint|null: false, foreign_key: true|
|images|json||
|rate|float|null: false|
### Association
- belongs_to :user
- belongs_to :restaurant
- has_many :likes
- has_many :liked_users

## Restaurants
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|address|string|null: false|
|phone|string||
|img|string||
|prefecture_id|integer||
|latitude|float||
|longitude|float||
### Association
- belongs_to_active_hash :prefecture
- has_many :reviews
- has_many :bookmarks, dependent: :destroy
- has_many :browsing_histories

## Likes
|Column|Type|Options|
|------|----|-------|
|review_id|bigint|null: false, foreign_key: true|
|user_id|bigint|null: false, foreign_key: true|
### Association
- belongs_to :review
- belongs_to :user

## Events
|Column|Type|Options|
|------|----|-------|
|title|string||
|content|text||
|start_time|datetime||
|user_id|bigint|null: false, foreign_key: true|
### Association
- belongs_to :user

## BrowsingHistories
|Column|Type|Options|
|------|----|-------|
|restaurant_id|bigint|null: false, foreign_key: true|
|user_id|bigint|null: false, foreign_key: true|
### Association
- belongs_to :restaurant
- belongs_to :user

## Bookmarks
|Column|Type|Options|
|------|----|-------|
|restaurant_id|bigint|null: false, foreign_key: true|
|user_id|bigint|null: false, foreign_key: true|
### Association
- belongs_to :restaurant
- belongs_to :user