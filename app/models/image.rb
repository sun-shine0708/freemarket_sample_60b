class Image < ApplicationRecord
  belongs_to :product,optional: true
  mount_uploader :url, ImageUploader

  validates :url,     presence: true
end
