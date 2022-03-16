class Group < ApplicationRecord
  validates :group_name, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :note, length: { maximum: 1000 }
  
  has_many :group_users
  has_many :users, through: :gourp_users
end

