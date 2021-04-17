FactoryBot.define do
  factory :user do
    nickname              { '空気' }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + 'a1' }
    password_confirmation { password }
    family_name           { '鈴木' }
    first_name            { 'もぐら' }
    family_name_kana      { 'スズキ' }
    first_name_kana       { 'モグラ' }
    birthday              { Faker::Date.birthday }
  end
end
