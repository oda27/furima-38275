require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    describe "ユーザー新規登録" do
      it "メールアドレス必須" do
        FactoryBot.build(:user)
        @user.email = ''
        @user.valid?
      end
      it "メールアドレス一意性" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
      end
      it "メールアドレス＠必須" do
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
        @user.password = '0000'
        @user.valid?
      end
      it "パスワード、パスワード（確認）値の一致" do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
      end
    end
end