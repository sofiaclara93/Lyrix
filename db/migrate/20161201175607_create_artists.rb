class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :twitter, null: false
      t.integer :artist_id, null: false

      t.timestamps(null: false)
    end
  end
end
