class User < ActiveRecord::Base
  has_secure_password
  has_many :likes, foreign_key: :liker_id
  has_many :likes, as: :likeable
  has_many :songs, through: :likes
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  def favorites
    self.likes.sum(:like_direction)
  end
end
