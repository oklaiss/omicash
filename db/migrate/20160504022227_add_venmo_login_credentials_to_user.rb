class AddVenmoLoginCredentialsToUser < ActiveRecord::Migration
  def change
    add_column :users, :venmo_username, :string
    add_column :users, :venmo_password, :string
  end
end
