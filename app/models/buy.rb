class Buy < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :item
  
  
  validates :price, presence: true

  end
end
