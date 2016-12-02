class Song < ActiveRecord::Base
  validates_presence_of :title, :artist, :album, :track_id
  has_many :likes, as: :likeable
  belongs_to :user

  def favorites
    self.likes.sum(:like_direction)
  end
end
