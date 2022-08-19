require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    describe "ユーザー新規登録" do
      context '新規登録できるとき' do
        it 'nicknameとemail、passwordとpassword_confirmation、kanji_last,first_nameとkana_last,first_name、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it "nicknameが空では登録できない" do
          FactoryBot.build(:user)
          @user.nickname = ''
          @user.valid?
        end
        it "メールアドレスが空では登録できない" do
          FactoryBot.build(:user)
          @user.email = ''
          @user.valid?
        end
        it "重複したメールアドレスは登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
        end
        it "メールアドレスに@を含まない場合は登録できない" do
          FactoryBot.build(:user)
          @user.email = 'testexample'
          @user.valid?
        end
        it "パスワード必須" do
          FactoryBot.build(:user)
          @user.password = ''
          @user.valid?
        end
        it "パスワード6文字以上" do
          FactoryBot.build(:user)
          @user.password = 'a0000'
          @user.valid?
        end
        it "パスワード、パスワード（確認）値の一致" do
          @user.password = 'aa0000'
          @user.password_confirmation = 'aaa0000'
          @user.valid?
        end
        it "英字のみのパスワードでは登録できない" do
          FactoryBot.build(:user)
          @user.password = 'aaaaaa'
          @user.valid?
        end
        it "数字のみのパスワードでは登録できない" do
          FactoryBot.build(:user)
          @user.password = '000000'
          @user.valid?
        end
        it "全角文字を含むパスワードでは登録できない" do
          FactoryBot.build(:user)
          @user.password = 'あaaaaa'
          @user.valid?
        end
        it "姓（全角）が空だと登録できない" do
          FactoryBot.build(:user)
          @user.kanji_last_name = ''
          @user.valid?
        end
        it "姓（全角）に半角文字が含まれていると登録できない" do
          FactoryBot.build(:user)
          @user.kanji_last_name = 'yamada'
          @user.valid?
        end
        it "名（全角）が空だと登録できない" do
          FactoryBot.build(:user)
          @user.kanji_first_name = ''
          @user.valid?
        end
        it "名（全角）に半角文字が含まれていると登録できない" do
          FactoryBot.build(:user)
          @user.kanji_first_name = 'taro'
          @user.valid?
        end
        it "姓（カナ）が空だと登録できない" do
          FactoryBot.build(:user)
          @user.kana_last_name = ''
          @user.valid?
        end
        it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
          FactoryBot.build(:user)
          @user.kana_last_name = '山田yamada!'
          @user.valid?
        end
        it "名（カナ）が空だと登録できない" do
          FactoryBot.build(:user)
          @user.kana_first_name = ''
          @user.valid?
        end
        it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
          FactoryBot.build(:user)
          @user.kana_first_name = '太郎taro!'
          @user.valid?
        end
        it "生年月日が空だと登録できない" do
          FactoryBot.build(:user)
          @user.birthday = ''
          @user.valid?
        end
      end
    end
end