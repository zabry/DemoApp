class AddTokenExpirationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :token_expiration, :datetime
  end
end
