class AddDefaultSalePercentage < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :sale_percentage
    add_column :albums, :sale_percentage, :decimal, default: 0.0
  end
end
