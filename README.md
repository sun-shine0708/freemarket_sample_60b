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
|comment|text|null: false|
|payment|string||

### Associatioin
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :streetaddresses

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|comment|string|null: false|
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
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- has_many :images

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
|genre|string|null: false, unique: true|
|ancestry|integerstring||

### Associatioin
- has_many :products
- has_ancestry

## bransテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Associatioin
- has_many :products

## streetaddressテーブル

|Column|Type|Options|
|------|----|-------|
|post_number|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|null: false|

### Associatioin
- belongs_to :user

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|url|text|null: false|
|product_id|integer|null:false,foreign_key:true|

### Associatioin
- belongs_to :product

## likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Associatioin
- belongs_to :user
- belongs_to :product
