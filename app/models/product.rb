class Product < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :category
  belongs_to :brand
  has_many :images


  validates :name,                  presence: true
  validates :comment,               presence: true
  validates :price,                 presence: true
  validates :status,                presence: true
  validates :costcharge,            presence: true
  validates :delivery_way,          presence: true
  validates :delivery_area,         presence: true
  validates :delivery_date,         presence: true
end
