class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :Schedule

  validates :comment, length: { maximum: 500 }
end
