class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null=>false
      t.string :email, :null=>false
      t.string :password_digest
      t.string :role

      t.timestamps
    end

    add_index :users, :username, :name=>"idx_users_username", :unique=>true
  end
end
