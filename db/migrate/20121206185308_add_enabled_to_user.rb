class AddEnabledToUser < ActiveRecord::Migration
  def change
    add_column :users, :enabled, :boolean
    User.update_all(:enabled => true)
  end
end
