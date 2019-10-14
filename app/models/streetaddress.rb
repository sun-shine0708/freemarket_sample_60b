class Streetaddress < ApplicationRecord
  belongs_to :user

  validates :last_name,:first_name,:last_name_kana,:first_name_kana,:post_number,:prefectures,:city,:address, presence: true
end