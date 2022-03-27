class Schedule < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :group_name, presence: true

end
