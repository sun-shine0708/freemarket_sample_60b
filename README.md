# README

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|nickname|string|null: false, unique: true|
|mail|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
|birthday|integer|null: false|
|post_number|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|comment|text|null: false|
|payment|string||

### Associatioin
- has_many :comments
- has_many :likes

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|comment|string|null: false|
|image|text|null: false, unique: true|
|price|integer|null: false|
|size|string||
|status|string|null: false|
|costcharge|string|null: false|
|delivery_way|string|null: false|
|delivery_area|string|null: false|
|delivery_date|string|null :false|
|price|integer|null: false|
|buyer_id|integer|class_name: "User"|
|seller_id|integer|class_name: "User"|
|category_id|integer|null: false,foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Associatioin
- belongs_to :user
- has_many :comments
- has_many :likes
- belongs_to :category
- belongs_to :brand

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false,foreign_key: true|
|product_id|integer|null: false,foreign_key: true|

### Associatioin
- belongs_to :user
- belongs_to :product_id

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|major|string|null: false|
|medium|string|null: false|
|small|string|null: false|

### Associatioin
- has_many :products

## bransテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Associatioin
- has_many :products

