class Cart < ApplicationRecord
  has_many :cart_items
  has_many :cart_coordinates

  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end

  def coordinate_total_price
    cart_coordinates.to_a.sum { |coordinate| coordinate.coordinate_total_price }
  end

  def total_quantity
    cart_items.to_a.sum { |item| item.quantity }
  end

  def coordinate_total_quantity
    cart_coordinates.to_a.sum { |coordinate| coordinate.quantity }
  end
end
