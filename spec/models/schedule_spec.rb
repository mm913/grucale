require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.create(:schedule)
    @group_user = FactoryBot.build(:group_user)
  end

  describe "スケジュール新規作成" do
    context "新規作成できる時" do
      it "titleとstart_timeとfinish_timeとnoteが入力されていると作成できる" do
        expect(@schedule).to be_valid
      end
      it "noteが空でも作成できる" do
        @schedule.note = ""
        expect(@schedule).to be_valid
      end
    end
    
    context "新規作成できない時" do
      it "titleが空では作成できない" do
        @schedule.title = ""
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("タイトルを入力してください")
      end
      it "start_timeが現在の日時より前では作成できない" do
        @schedule.start_time = "2000/04/30/12/0/0"
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("開始日時は現在の日時より遅い時間を選択してください")
      end
      it "finish_timeがfirst_timeより前では作瀬できない" do
        @schedule.finish_time = "2000/04/30/12/0/0"
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("終了日時は開始時刻より遅い時間を選択してください")
      end
      it "noteが1000文字を超えると差癖できない" do
        @schedule.note = "ABC" * 1000
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("備考は1000文字以内で入力してください")
      end
    end
  end
end
