FactoryBot.define do
  factory :coordinate do
    name          {Faker::Name.name}
    total_price   {"1300"}
    set           {"1"}
    explain       {"おすすめです"}
    postage       {"送料無料"}
    shipping_date {"4〜7日で発送"}
    gender        {"メンズ"}
    image         {File.open("#{Rails.root}/public/images/unnamed.jpg")}
    user
    shop

    trait :invalid do
      name        {""}
    end
  end
end
