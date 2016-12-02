class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :likes, foreign_key: :liker_id
  has_many :likes, as: :likeable
  
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

end
