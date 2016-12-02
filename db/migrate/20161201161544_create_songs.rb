class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.string :album, null: false
      t.string :lyrics, null: false
      t.integer :track_id, null: false
      t.references :user
      
      t.timestamps(null: false)
    end
  end
end
