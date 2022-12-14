class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_price
  belongs_to :prefecture
  belongs_to :send_day

  validates :name, :explanation, :price, :image, presence: true

  validates :category_id, :condition_id, :send_price_id, :prefecture_id, :send_day_id, numericality: { other_than: 1 , message: "can't be blank"} 

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}


end
