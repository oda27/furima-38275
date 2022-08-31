require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品の購入' do
    context "商品が購入できる場合" do
      it "すべての値が正しく入力されていれば購入できること" do
        expect(@address).to be_valid
      end
      it "建物名は空でも保存できること" do
        @address.building_name = ''
        expect(@address).to be_valid        
      end
    end

    context "商品が購入できない場合" do
      it "郵便番号が空だと保存できないこと" do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと'" do
        @address.post_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県を選択していないと保存できないこと" do
        @address.prefecture_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空だと保存できないこと" do
        @address.municipalities = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "番地が空だと保存できないこと" do
        @address.house_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it "番地が空だと保存できないこと" do
        @address.house_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が空だと保存できないこと" do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号に半角のハイフンが含まれていると保存できないこと" do
        @address.house_number = '000-0000-0000'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が11文字以上だと保存できないこと" do
        @address.house_number = '000011112222'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が10文字以下だと保存できないこと" do
        @address.house_number = '000111222'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end

