FactoryBot.define do
  factory :image do
    item_image {File.open("#{Rails.root}/public/images/unnamed.jpg")}
    item
  end
end
