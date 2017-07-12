class AddAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.decimal :price
      t.integer :quantity
      t.string :img_src, default: "cover.jpg"
      t.boolean :on_sale, default: false
      t.integer :sale_percentage

      t.timestamps
    end
  end
end
