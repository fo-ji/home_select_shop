FactoryBot.define do
  factory :recommend do
    name         {Faker::Name.last_name}
    image        {File.open("#{Rails.root}/public/images/unnamed.jpg")}
    genre        {"本"}
    introduction {Faker::Lorem.sentence}
    url          {Faker::Internet.url}
    user
    community
  end
end
