FactoryBot.define do
  factory :shop do
    name              {"ヤマ"}
    email             {"bbb@gmail.com"}
    avatar            {File.open("#{Rails.root}/public/images/unnamed.jpg")}
    introduction      {"タロウ"}
    postal_code       {"222-2222"}
    prefecture        {"大阪府"}
    city              {"大阪市"}
    address           {"北区1-1-1"}
    apartment         {"丸ビル101"}
    phone_number      {"0611111111"}
    official_site     {"https://www.sample.com/1"}
    facebook_account  {"https://www.sample.com/2"}
    line_account      {"https://www.sample.com/3"}
    instagram_account {"https://www.sample.com/4"}

    trait :stylist do
      after(:build) do |shop|
        shop.users << build(:user)
      end
    end
  end
end
