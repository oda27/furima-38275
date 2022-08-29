class Buyform
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:prefecture_id,:municipalities,:house_number,:building_name,:phone_number

  validates :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :house_number, :phone_number, presence: true

  def save
    @buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, phone_number: phone_number)
  end
end