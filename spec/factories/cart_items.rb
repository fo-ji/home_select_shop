FactoryBot.define do
  factory :cart_item do
    quantity { 1 }
    item
    cart
  end
end
