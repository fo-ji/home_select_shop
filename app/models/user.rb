class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one    :address,     dependent: :destroy
  has_one    :credit_card, dependent: :destroy
  has_many   :stylists
  has_many   :shops, through: :stylists

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :credit_card

  validates :nickname, presence: true, uniqueness: true, on: [:create, :edit]
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true, on: [:create, :edit]
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, on: [:create, :edit]
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }, on: [:create, :edit]
  validates :height, :body_weight, presence: true, length: { in: 2..3 }, format: { with: /\A[0-9]+\z/ }, on: [:create, :edit]
  validates :foot_size, presence: true, on: [:create, :edit]

  mount_uploader :avatar, ImageUploader

  enum foot_size: { "20.0cm": 0, "20.5cm": 1, "21.0cm": 2, "21.5cm": 3, "22.0cm": 4, "22.5cm": 5,
                    "23.0cm": 6, "23.5cm": 7, "24.0cm": 8, "24.5cm": 9, "25.0cm": 10, "25.5cm": 11,
                    "26.0cm": 12, "26.5cm": 13, "27.0cm": 14, "27.5cm": 15, "28.0cm": 16, "28.5cm": 17,
                    "29.0cm": 18, "29.5cm": 19, "30.0cm": 20 }

  def self.search(search)
    return User.all() unless search
    User.where("name LIKE ?", "%#{search}%") 
  end
end
