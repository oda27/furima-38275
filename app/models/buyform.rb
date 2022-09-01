class Buyform
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:prefecture_id,:municipalities,:house_number,:building_name,:phone_number,:token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :municipalities
    validates :house_number
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, length: { minimum: 8 , maximum: 11}
    validates :phone_number, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, phone_number: phone_number, buy_id: buy.id)
  end
  
end