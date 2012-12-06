class UserRoleNotNull < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, :null => false
  end

  def down
    change_column :users, :role, :string, :null => true
  end
end
