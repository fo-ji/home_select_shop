class Brand < ApplicationRecord
  has_many :items

  validates :brand, presence: true

  enum brand: { "nano･universe": 0, "SHIPS": 1, "FREAK'S STORE": 2, "NIKE": 3, "BEAUTY&YOUTH UNITED ARROWS": 4, "adidas": 5,
  "classicalelf": 6, "Champion": 7, "green label relaxing": 8, "BEAMS": 9, "LACOSTE": 10, "GLOBAL WORK": 11,
  "ショップオリジナル": 12, "ノーブランド": 13 }
end
