class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  validates :comment, length: { maximum: 500 }
end
