class Product < ApplicationRecord
  # belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id',optional: true
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy

  belongs_to :category,optional: true

  # belongs_to :brand
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :name,                  presence: true, length: { maximum: 40 }
  validates :comment,               presence: true, length: { maximum: 100 }
  validates :price,                 presence: true, length: { maximum: 7 }
  validates :status,                presence: true
  validates :costcharge,            presence: true
  validates :delivery_way,          presence: true
  validates :delivery_area,         presence: true
  validates :delivery_date,         presence: true
  validates :category_id,              presence: true
end
