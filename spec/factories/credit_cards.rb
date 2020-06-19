FactoryBot.define do
  factory :credit_card do
    card_number           {"1111111111111111"}
    card_company          {"VISA"}
    card_year             {"25"}
    card_month            {"12"}
    card_pass             {"111"}
    user
  end
end
