class User < ApplicationRecord
  has_secure_password

  has_many :following_relationships, -> { where accepted: true },
                          class_name:  "Relationship",
                          foreign_key: "follower_id",
                          dependent:   :destroy

  has_many :follower_relationships, -> { where accepted: true },
                            class_name:  "Relationship",
                            foreign_key: "followed_id",
                            dependent:   :destroy

  has_many :pending_following_relationships, -> { where accepted: false },
                              class_name:  "Relationship",
                              foreign_key: "follower_id"

  has_many :pending_follower_relationships, -> { where accepted: false },
                              class_name:  "Relationship",
                              foreign_key: "followed_id"

  has_many :followings, class_name: 'User', through: :following_relationships, source: :followed
  has_many :followers, class_name: 'User', through: :follower_relationships, source: :follower

  scope :clean, -> { select(:id, :first_name, :last_name, :username, :email) }

  has_many :tweets, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "150x150>", small: "75x75>", thumb: "38x38>" }, default_url: "/assets/missing_avatar_:style.jpg"

  validates_presence_of :first_name, :last_name, :username, :email, :password_digest
  validates_uniqueness_of :username, :email
end
