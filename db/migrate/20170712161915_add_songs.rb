class AddSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.integer :album_id
      t.string :name
      t.string :length

      t.timestamps
    end
  end
end
