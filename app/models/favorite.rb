class Favorite < ActiveRecord::Base
  belongs_to :liker, class_name: "User"
  belongs_to :likeable, polymorphic: true
  validates_uniqueness_of :liker, scope: [:likeable_id, :likeable_type]
end
