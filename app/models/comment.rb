class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  belongs_to :group

end
