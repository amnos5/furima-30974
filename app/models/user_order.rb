class UserOrder
  include ActiveModel::Model
  attr_accessor :name, :postal_code, :prefectures, :city, :house_number, :build_number, :phone_number, :price, :user_id, :token, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefectures, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A\d{11}\z/, message: 'Contains hyphen(-)' }
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create(order_id: order.id, postal_code: postal_code, prefectures: prefectures, city: city, house_number: house_number, build_number: build_number, phone_number: phone_number)
  end
end