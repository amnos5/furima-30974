FactoryBot.define do
  factory :user_order do
    card_token { 'tok_321e8dbe8388244b11c68353362b' }
    postal_code  { '111-1111' }
    prefectures  { 4 }
    city         { '面白市' }
    house_number { '四丁目' }
    build_number { 'スゴイビル' }
    phone_number { '11111111111' }
  end
end