class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name,          presence: true
  # validates :name_kana,     presence: true
  # validates :nickname,      presence: true, length: { maximum: 20 }, uniqueness: true
  # validates :birthday,      presence: true
  # validates :password,      length: { minimum: 7 }
end
