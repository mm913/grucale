class Schedule < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 24}
  validates :user_id, presence: true
  validates :group_id, presence: true
  validate :start_finish_check
  validate :start_check
  validates :note, length: { maximum: 1000 }

  def start_finish_check
    errors.add(:finish_time, "終了日時は開始時刻より遅い時間を選択してください") if self.start_time > self.finish_time
  end

  def start_check
    errors.add(:start_time, "開始日時は現在の日時より遅い時間を選択してください") if self.start_time < Time.now
  end

end
