require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
  end

  describe '商品の購入' do
    context "商品が購入できる場合" do
      it "" do
      end
    end
    context "商品が購入できない場合" do
      it "" do
        @buy. = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("")
      end
    end
end
