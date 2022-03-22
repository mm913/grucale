require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  before do
    @group_user = FactoryBot.build(:group_user)
  end

  describe "グループ新規作成" do
    context "新規作成できる時" do
      it "user_itとgroup_idが紐ついていれば作成できる" do
        expect(@group_user).to be_valid
      end
    end

    context "新規作成できない時" do
      it "user_idが紐ついていなければ作成できない" do
        @group_user.user = nil
        @group_user.valid?
        expect(@group_user.errors.full_messages).to include("Userを入力してください")
      end
      it "group_idが紐ついていなければ作成できない" do
        @group_user.group = nil
        @group_user.valid?
        expect(@group_user.errors.full_messages).to include("Groupを入力してください")
      end
    end
  end
end
