class CartCoordinate < ApplicationRecord
  belongs_to :coordinate
  belongs_to :cart

  def coordinate_total_price
    coordinate.total_price * quantity
  end
end
