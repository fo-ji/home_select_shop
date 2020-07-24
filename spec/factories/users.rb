FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"aaaa111"}
    password_confirmation {"aaaa111"}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
    birthday              {"2000/01/01"}
    height                {"160"}
    body_weight           {"50"}
    foot_size             {"25.0cm"}
  end
end
