class Buyform
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:prefecture_id,:municipalities,:house_number,:building_name,:phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, length: { maximum: 11 }
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, phone_number: phone_number, buy_id: buy.id)
  end
end