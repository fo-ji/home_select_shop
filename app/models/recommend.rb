class Recommend < ApplicationRecord
  belongs_to :community
  belongs_to :user

  validates :name, :image, :genre, :introduction, presence: true
  validates :url, format: { with: /\A#{URI::regexp(%w(http https))}\z/ }

  enum genre: { "雑貨": 0, "インテリア": 1, "音楽": 2, "本": 3, "その他": 4 }

  mount_uploader :image, ImageUploader
end
