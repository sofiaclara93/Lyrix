class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  has_many :songs
  has_many :likes, foreign_key: :liker_id
end
