class Group < ApplicationRecord
  validates :group_name, presence: true
  validates :group_name, uniqueness: { case_sensitive: false }
  validates :note, length: { maximum: 1000 }
  
  has_many :group_users
  has_many :users, through: :group_users
  has_one :schedule, dependent: :destroy
  has_many :comments

  def self.search(search)
    if search != ""
      Group.where('group_name LIKE(?)', "%#{search}%")
    end
  end
end

