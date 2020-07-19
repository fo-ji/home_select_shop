class Community < ApplicationRecord
  has_many   :community_users
  has_many   :users, through: :community_users
  # has_many   :talks, dependent: :destroy
  belongs_to :shop

  validates :name, :owner,          presence: true, uniqueness: true
  validates :avatar, :introduction, presence: true

  mount_uploader :avatar, ImageUploader
end
