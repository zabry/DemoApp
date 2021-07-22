class AddAuthenticationTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :authentication_token, :string, limit: 512
    add_index :users, :authentication_token, unique: true
  end
end
