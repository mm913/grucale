class Schedule < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :title, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true

end
