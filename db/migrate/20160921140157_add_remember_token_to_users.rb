class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :remember_token, :string, :default => 0
  	add_index  :users, :remember_token
  end
end
