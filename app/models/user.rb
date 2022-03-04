class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :encrypted_password,:password,:password_confirmation,length:{minimum:6},format:{with: /(?=.[a-zA-Z])(?=.\d)[a-zA-Z\d]{6,}/}
  validates :department_name,  length: { maximum: 50 }
end
