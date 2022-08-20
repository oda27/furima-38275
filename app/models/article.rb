class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :send_price, :prefecture, :send_day 

  validates :name, :explanation, presence: true

  validates :category_id, :condition_id, :send_price_id, :prefecture_id, :send_day_id, numericality: { other_than: 1 , message: "can't be blank"} 

end