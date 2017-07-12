class AddDefaultTotalOrderPrice < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :total_price, :decimal
    add_column :orders, :total_price, :decimal, default: 0.00
  end
end
