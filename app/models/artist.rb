class Artist < ActiveRecord::Base
  validates_presence_of :name, :artist_id
end
