require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録ができる時" do
      it "name,email,password,password_confirmation,department_nameが入力されていると登録できる" do
        expect(@user).to be_valid
      end
      it "department_nameが空でも登録できる" do
        @user.department_name = ''
        expect(@user).to be_valid
      end
      it "imageが空でも登録できる" do
        @user.image = nil
        expect(@user).to be_valid
      end
    end

    context "新規登録ができない時" do
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = "aa1234"
        @user.password_confirmation = "bb1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが6文字未満だと登録できない" do
        @user.password = "aa123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが英字だけだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角だけだと登録できない" do
        @user.password = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "department_nameが51文字以上だと登録できない" do
        @user.department_name = "あああ"*50
        @user.valid?
        expect(@user.errors.full_messages).to include("Department name is too long (maximum is 50 characters)")
      end
    end
  end
end
