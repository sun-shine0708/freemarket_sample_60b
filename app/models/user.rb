class User < ApplicationRecord
  has_many :buyer_products, class_name: 'Product', foreign_key: 'buyer_id'
  has_many :seller_products, class_name: 'Product', foreign_key: 'seller_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    credential = Credential.where(uid: uid, provider: provider).first
    if credential.present?
      user = User.where(id: credential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        Credential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.new
      end
    end
    return user
  end

  has_one :streetaddress, dependent: :destroy
  has_one :creditcard, dependent: :destroy
  has_many :credentials, dependent: :destroy

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }

  validates :nickname,   presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password,   length: { minimum: 7 }
  validates :last_name,:first_name,:last_name_kana,:first_name_kana,:birth_year,:birth_month,:birth_day, presence: true
end
