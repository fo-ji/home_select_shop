FactoryBot.define do
  factory :cart_item do
    quantity { 1 }
    item { nil }
    cart { nil }
  end
end
