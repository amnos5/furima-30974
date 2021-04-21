FactoryBot.define do
  factory :user_order do
    # user_id      {}
    # item_id      {}
    postal_code  { '111-1111' }
    prefectures  { 4 }
    city         { '面白市' }
    house_number { '四丁目' }
    build_number { 'スゴイビル' }
    phone_number { '11111111111' }

    association :user
    association :item
  end
end