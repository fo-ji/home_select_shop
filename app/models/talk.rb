class Talk < ApplicationRecord
  belongs_to :community
  belongs_to :user

  validates :talk, presence: true, unless: :image?
  
  mount_uploader :image, ImageUploader
end
