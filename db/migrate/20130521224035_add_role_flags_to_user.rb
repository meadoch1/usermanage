class AddRoleFlagsToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :supervisor, :boolean
    add_column :users, :csr, :boolean
  end
end
