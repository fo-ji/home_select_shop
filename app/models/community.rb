class Community < ApplicationRecord
  has_many :communities_users
  has_many :users, through: :communities_users
  has_many :talks, dependent: :destroy

  validates :name, :owner,          presence: true, uniqueness: true
  validates :avatar, :introduction, presence: true

  mount_uploader :avatar, ImageUploader
end
