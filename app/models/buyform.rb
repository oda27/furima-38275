class Buyform
  include ActiveModel::Model
  attr_accessor :user,:item,:buy,:post_code,:prefecture_id,:municipalities,:address,:building_name,:phone_number

  validates :user, :item, :buy, :post_code, :prefecture_id, :municipalities, :address, :phone_number, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end