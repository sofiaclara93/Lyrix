class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :likeable_id
      t.string :likeable_type
      t.references :liker
      t.integer :like_direction, default: 0

      t.timestamps(null: false)
    end
  end
end
