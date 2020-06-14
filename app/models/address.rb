class Address < ApplicationRecord
  belongs_to :user

  validates :postal_code, :prefecture, :city, :address, :phone_number, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
end
