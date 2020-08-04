FactoryBot.define do
  factory :cart_coordinate do
    quantity { 1 }
    coordinate
    cart
  end
end
