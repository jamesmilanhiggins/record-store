class AddAccountsAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts_albums do |t|
      t.integer :account_id
      t.integer :album_id
      t.timestamps
    end
  end
end
