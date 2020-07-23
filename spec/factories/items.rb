FactoryBot.define do
  factory :item do
    name          {"Tシャツ"}
    price         {"1300"}
    explain       {"赤色です"}
    size          {"FREESIZE"}
    postage       {"送料無料"}
    shipping_date {"4〜7日で発送"}
    gender        {"メンズ"}
    stock         {"1"}
    user
    shop
    brand
    category
  end
end
