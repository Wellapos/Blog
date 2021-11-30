class RemoveDefaultValueRoleUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role_id, :bigint, :default => ''
  end
end
