class SwitchAccountUserRelationship < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :account_id
    add_column :accounts, :user_id, :integer
  end
end
