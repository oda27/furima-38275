class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :buys
  
  with_options presence: true do
    validates :nickname 
    validates :birthday
  end
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true,
  format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :kanji_last_name
    validates :kanji_first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/u } do
    validates :kana_last_name
    validates :kana_first_name
  end


end
