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

  has_many :followed_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followeds, through: :followed_relationships

  has_many :follower_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def followed?(other_user)
    followed_relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    followed_relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    followed_relationships.find_by(followed_id: other_user.id).destroy
  end
end
