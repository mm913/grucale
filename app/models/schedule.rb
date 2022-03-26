class Schedule < ApplicationRecord
  belongs_to :group

  validates :group_name, presence: true

end
