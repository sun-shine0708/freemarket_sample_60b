class BrandCategory < ApplicationRecord
  has_many :brands
  has_many :brand_categories, through: :set_brands
end
