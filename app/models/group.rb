class Group < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :authentication_keys => [:groupname] 
  validates :groupname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, on: :create

end
