class AddUserToken < ActiveRecord::Migration
  def change
    add_column :users, :token, :string, limit: 16
  end
end
