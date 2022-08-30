require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品の購入' do
    context "商品が購入できる場合" do
      it "" do
      end
    end
    context "商品が購入できない場合" do
      it "" do
        @address. = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("")
      end
    end
  end
end

