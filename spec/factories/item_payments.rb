FactoryBot.define do
  factory :item_payment do
    purchase_amount {5}
    charge_id       {Faker::Internet.uuid}
    user
    item
  end
end
