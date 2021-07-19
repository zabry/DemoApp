class CreateAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test_module, null: false, foreign_key: true
      t.float :score
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
