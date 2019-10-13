class Streetaddress < ApplicationRecord
  belongs_to :user

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, format: { with: VALID_PHONE_REGEX }

  validates :last_name,:first_name,:last_name_kana,:first_name_kana,:post_number,:prefectures,:city,:address, presence: true
end