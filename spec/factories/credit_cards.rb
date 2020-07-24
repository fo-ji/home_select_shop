FactoryBot.define do
  factory :credit_card do
    customer_id {Faker::Number.number(digits: 10)}
    card_id     {Faker::Number.number(digits: 10)}
    user
  end
end
