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
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = "aa1234"
        @user.password_confirmation = "bb1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが6文字未満だと登録できない" do
        @user.password = "aa123"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが英字だけだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが全角だけだと登録できない" do
        @user.password = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "department_nameが51文字以上だと登録できない" do
        @user.department_name = "あああ"*50
        @user.valid?
        expect(@user.errors.full_messages).to include("部署名は50文字以内で入力してください")
      end
    end
  end
end
