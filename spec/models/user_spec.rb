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
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "メールアドレスが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したメールアドレスは登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it "メールアドレスに@を含まない場合は登録できない" do
          @user.email = 'testexample'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it "パスワード必須" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "パスワード6文字以上" do
          @user.password = 'a0000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it "パスワード、パスワード（確認）値の一致" do
          @user.password = 'aa0000'
          @user.password_confirmation = 'aaa0000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "英字のみのパスワードでは登録できない" do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it "数字のみのパスワードでは登録できない" do
          @user.password = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it "全角文字を含むパスワードでは登録できない" do
          @user.password = 'あaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it "姓（全角）が空だと登録できない" do
          @user.kanji_last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
        end
        it "姓（全角）に半角文字が含まれていると登録できない" do
          @user.kanji_last_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji last name is invalid")
        end
        it "名（全角）が空だと登録できない" do
          @user.kanji_first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
        end
        it "名（全角）に半角文字が含まれていると登録できない" do
          @user.kanji_first_name = 'taro'
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji first name is invalid")
        end
        it "姓（カナ）が空だと登録できない" do
          @user.kana_last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana last name can't be blank")
        end
        it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
          @user.kana_last_name = '山田yamada!'
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana last name is invalid")
        end
        it "名（カナ）が空だと登録できない" do
          @user.kana_first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana first name can't be blank")
        end
        it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
          @user.kana_first_name = '太郎taro!'
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana first name is invalid")
        end
        it "生年月日が空だと登録できない" do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
end