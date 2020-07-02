class Image < ApplicationRecord
  belongs_to :item

  validates :item_image, presence: true

  mount_uploader :item_image, ImageUploader
end
