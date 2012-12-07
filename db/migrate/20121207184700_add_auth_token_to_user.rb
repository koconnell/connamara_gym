class AddAuthTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string
    User.reset_column_information
    User.all.each {|u|
      u.generate_auth_token(true)
    }
  end
end
