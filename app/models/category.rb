
class Category < ApplicationRecord
  has_ancestry
  has_many :products, through: :product_categories
end
