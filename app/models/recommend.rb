class Recommend < ApplicationRecord
  belongs_to :community
  belongs_to :user

  validates :name, :image, :genre, :introduction, presence: true

  enum gender: { "雑貨": 0, "インテリア": 1, "音楽": 2, "本": 3, "その他": 4 }

  mount_uploader :image, ImageUploader
end
