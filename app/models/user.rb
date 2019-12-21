class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :Trackable, :Timeoutable

  mount_uploader :image, UserImageUploader, dependent: :destroy
  has_one  :user_detail, dependent: :destroy
  has_many :beginners, dependent: :destroy
  has_many :intermediates, dependent: :destroy
  has_many :seniors, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :group_messages, dependent: :destroy
  has_many :beginner_comments, dependent: :destroy
  has_many :intermediates_comments, dependent: :destroy
  has_many :senior_comments, dependent: :destroy
  has_many :user     , class_name: 'private_message' , foreign_key: 'user_id'     , dependent: :destroy
  has_many :send_user, class_name: 'private_message' , foreign_key: 'send_user_id', dependent: :destroy

  has_many :followed_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followeds, through: :followed_relationships, source: :followed

  has_many :follower_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

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
