class Size < ApplicationRecord
  has_many :size_categories
  has_many :categories, through: :size_categories
  has_many :products
end
