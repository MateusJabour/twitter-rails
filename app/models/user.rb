class User < ApplicationRecord
  has_secure_password
  has_many :tweets, dependent: :destroy

  validates_presence_of :first_name, :last_name, :username, :email, :password_digest
  validates_uniqueness_of :username, :email
end
