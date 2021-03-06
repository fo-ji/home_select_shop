FactoryBot.define do
  factory :item do
    name          {Faker::Name.name}
    price         {"1300"}
    explain       {"赤色です"}
    size          {"FREESIZE"}
    postage       {"送料無料"}
    shipping_date {"4〜7日で発送"}
    gender        {"メンズ"}
    stock         {"10"}
    user
    shop
    brand
    category

    trait :invalid do
      name        {""}
    end
  end
end
