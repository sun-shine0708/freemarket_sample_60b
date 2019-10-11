class User < ApplicationRecord
  has_many :buyer_products, class_name: 'Product', foreign_key: 'buyer_id'
  has_many :seller_products, class_name: 'Product', foreign_key: 'seller_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :streetaddress, dependent: :destroy
  has_one :creditcard, dependent: :destroy

  # validates :name,          presence: true
  # validates :name_kana,     presence: true
  # validates :nickname,      presence: true, length: { maximum: 20 }, uniqueness: true
  # validates :birthday,      presence: true
  # validates :password,      length: { minimum: 7 }
end
