class Song < ActiveRecord::Base
  validates_presence_of :title, :artist, :album
  belongs_to :user
  has_many :likes, as: :likeable

  def favorites
    self.likes.sum(:like_direction)
  end
end
