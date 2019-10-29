class Searchsize < ApplicationRecord
  has_many :sizes, through: :searchsize_sizes
  has_many :searchsize_sizes
end
