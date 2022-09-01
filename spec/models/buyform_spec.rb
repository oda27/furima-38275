require 'rails_helper'

RSpec.describe Buyform, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyform = FactoryBot.build(:buyform, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入' do
    context "商品が購入できる場合" do
      it "すべての値が正しく入力されていれば購入できること" do
        expect(@buyform).to be_valid
      end
      it "建物名は空でも購入できること" do
        @buyform.building_name = ''
        expect(@buyform).to be_valid        
      end
      it "tokenがあれば購入ができること" do
        expect(@buyform).to be_valid
      end
    end

    context "商品が購入できない場合" do
      it "郵便番号が空だと購入できないこと" do
        @buyform.post_code = ''
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号が半角のハイフンを含んだ正しい形式でないと購入できないこと'" do
        @buyform.post_code = '1234567'
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県を選択していないと購入できないこと" do
        @buyform.prefecture_id = '1'
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空だと購入できないこと" do
        @buyform.municipalities = ''
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "番地が空だと購入できないこと" do
        @buyform.house_number = ''
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が空だと購入できないこと" do
        @buyform.phone_number = ''
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Phone number can't be blank", "Phone number is too short (minimum is 9 characters)")
      end
      it "電話番号に半角のハイフンが含まれていると購入できないこと" do
        @buyform.phone_number = '000-000-000'
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Phone number is not a number")
      end
      it "電話番号が11文字以上だと購入できないこと" do
        @buyform.phone_number = '000011112222'
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "tokenが空では購入ができないこと" do
        @buyform.token = nil
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @buyform.user_id = nil
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @buyform.item_id = nil
        @buyform.valid?
        expect(@buyform.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
