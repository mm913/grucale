require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe "グループ新規作成" do
    context "新規作成できる時" do
      it "group_nameとnoteが入力されていると作成できる" do
        expect(@group).to be_valid
      end
      it "noteが空でも作成できる" do
        @group.note = ""
        expect(@group).to be_valid
      end
    end

    context "新規作成できない時" do
      it "group_nameが空では作成できない" do
        @group.group_name = ""
        @group.valid?
        expect(@group.errors.full_messages).to include("グループ名を入力してください")
      end
      it "group_nameが6文字未満では作成できない" do
        @group.group_name = "ABC"
        @group.valid?
        expect(@group.errors.full_messages).to include("グループ名は6文字以上で入力してください")
      end
      it "noteが1000文字を超えると作成できない" do
        @group.note = "ABC" * 1000
        @group.valid?
        expect(@group.errors.full_messages).to include("備考は1000文字以内で入力してください")
      end
    end
  end
end
