class CreditCard < ApplicationRecord
  belongs_to :user

  validates :card_number, :card_company, :card_year, :card_month,:card_pass, presence: true
  validates :card_number, :card_pass, numericality: { only_integer: true }
  validates :card_number, length: { is: 16 }
  validates :card_pass, length: { in: 3..4 }
end
