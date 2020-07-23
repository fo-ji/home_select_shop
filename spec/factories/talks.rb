FactoryBot.define do
  factory :talk do
    talk      {Faker::Lorem.sentence}
    image     {File.open("#{Rails.root}/public/images/unnamed.jpg")}
    community
    user
  end
end
