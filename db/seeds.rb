# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.create!(
  :username=>"admin",
  :role=>User::Role::Admin,
  :password=>"adminpass",
  :password_confirmation=>"adminpass",
  :email=>"admin@example.com",
)

User.create!(
  :username=>"noob",
  :role=>User::Role::BasicUser,
  :password=>"noobpass",
  :password_confirmation=>"noobpass",
  :email=>"noob@example.com",
)

User.create!(
  :username=>"vet",
  :role=>User::Role::AdvancedUser,
  :password=>"vetpass",
  :password_confirmation=>"vetpass",
  :email=>"vet@example.com",
)
