class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one    :address,     dependent: :destroy
  has_one    :credit_card, dependent: :destroy
  has_many   :stylists
  has_many   :shops, through: :stylists
  has_many   :item_payments
  has_many   :community_users
  has_many   :communities, through: :community_users
  has_many   :talks, dependent: :destroy
  has_many   :recommends, dependent: :destroy

  accepts_nested_attributes_for :address

  validates :nickname, presence: true, uniqueness: true
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :height, :body_weight, presence: true, length: { in: 2..3 }, format: { with: /\A[0-9]+\z/ }
  validates :foot_size, presence: true

  mount_uploader :avatar, ImageUploader

  enum foot_size: { "20.0cm": 0, "20.5cm": 1, "21.0cm": 2, "21.5cm": 3, "22.0cm": 4, "22.5cm": 5,
                    "23.0cm": 6, "23.5cm": 7, "24.0cm": 8, "24.5cm": 9, "25.0cm": 10, "25.5cm": 11,
                    "26.0cm": 12, "26.5cm": 13, "27.0cm": 14, "27.5cm": 15, "28.0cm": 16, "28.5cm": 17,
                    "29.0cm": 18, "29.5cm": 19, "30.0cm": 20 }

  def self.search(input, id)
    return nil if input == ""
    User.where( ["email LIKE ?", "%#{input}"] ).where.not(id: id).limit(1)
  end
end
