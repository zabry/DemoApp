class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.integer :mobile
      t.date :dob
      t.references :board, foreign_key: true
      t.references :classroom, foreign_key: true
      t.integer :one_time_password
      t.datetime :otp_expires_at

      t.timestamps
    end
  end
end
