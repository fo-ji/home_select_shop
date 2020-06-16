class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address,     dependent: :destroy
  has_one :credit_card, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }
  validates :height, :body_weight, presence: true, length: { in: 2..3 }, format: { with: /^[0-9]+$/ }
  validates :foot_size, presence: true
end
