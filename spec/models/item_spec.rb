require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品が出品できる場合" do
      it "画像と名前と説明とカテゴリーと状態と配送料の負担と配送元の地域と発送までの日数と価格があれば商品は出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が出品できない場合" do
      it "画像がないと商品は出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "名前がないと商品は出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "説明がないと商品は出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end     
      it "カテゴリーがないと商品は出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "状態がないと商品は出品できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end     
      it "配送料の負担がないと商品は出品できない" do
        @item.send_price_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Send price can't be blank")
      end
      it "配送元の地域がないと商品は出品できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end     
      it "発送までの日数がないと商品は出品できない" do
        @item.send_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end
      it "価格がないと商品は出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が¥300以下だと商品は出品できない" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が¥9,999,999以上だと商品は出品できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格が数字以外だと商品は出品できない" do
        @item.price = '価格'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
