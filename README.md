# Regyu.site
![screencapture-localhost-3000-2020-11-01-18_59_33](https://user-images.githubusercontent.com/63589113/97800283-49d03580-1c77-11eb-96a4-b00baf71de58.png)

 自分が大好きな焼肉の専門レビューサイトを作りました。自分の知らない美味しい焼肉店を知りたいという強い思いで作りました。<br>
 I made a special review site for yakiniku that I love. I made it with a strong desire to know a delicious yakiniku restaurant that I do not know.<br><br>
 
 「Regyu.site」は、レビュー機能だけでなく、ランキング、ブックマーク、カレンダー機能などを搭載し、このサービスで自分が行きたいお店を見つけ、実際に行くまでのスケジューリングまで考えられたサービスです。<br>
 "Regyu.site" is equipped with not only a review function but also a ranking, bookmark, calendar function, etc., and it is a service that allows you to find the store you want to go to and schedule it until you actually go.<br>
 
# アプリ説明（Description）
 まずは、CRUD機能をシンプルに入れました。ほとんどは基本的な機能を意識し、その中で実際の実務や運用する上で必要な機能を少し足しました。<br>
 First of all, I added the CRUD function simply. Most of them were conscious of the basic functions, and added a few functions necessary for actual operation.<br><br>
 ・管理者画面(Administrator screen)<br>
 ・API<br>
 ・git hub<br>
 ・ページ構成(Page structure)<br>
 
# URI

# 開発環境（Requirements）＆<br>各種機能（Various functions）
 Rails 6.0.3.4<br>
 データベース（psql (PostgreSQL) 12.4）<br>
 ユーザー登録・ログイン機能（devise (4.7.3)）<br>
 CSSフレームワーク（bootstrap (4.1.3)）<br>
 アイコン（font-awesome-sass (5.15.1)）<br>
 画像アップロード（carrierwave (2.1.0)）<br>
 グーグルマップAPI（geocoder (1.6.4)）<br>
 カレンダー機能（simple_calendar (2.4.1)）<br>
 ページネーション（kaminari (1.2.1)）<br>
 検索機能（ransack (2.3.2)）<br>
 レビュー（jquery.raty）<br>
 いいね、ブックマーク（Ajax）<br>
 <br>
 
# デモ（Demo）
## 登録（New post action）

## 編集（Edit action）

## 削除（Delete action）


 
 
 
# データベース設計（Design DataBase scheme）

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
