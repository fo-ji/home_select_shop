FactoryBot.define do
  factory :community do
    name         {"コミュニティ"}
    owner        {"太郎"}
    avatar       {File.open("#{Rails.root}/public/images/unnamed.jpg")}
    introduction {"タロウ"}
    shop

    trait :community_user do
      after(:build) do |community|
        community.users << build(:user)
      end
    end
  end
end
