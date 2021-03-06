class AddOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :status, default: "Active"
      t.integer :account_id
      t.decimal :total_price

      t.timestamps
    end
  end
end
