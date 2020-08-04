FactoryBot.define do
  factory :coordinate_payment do
    purchase_amount {5}
    charge_id       {Faker::Internet.uuid}
    user
    coordinate
  end
end
