class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :Trackable, :Timeoutable

  mount_uploader :image, UserImageUploader
  has_one  :user_detail
  has_many :beginners
  has_many :intermediates
  has_many :seniors
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
end
