class CreateTestModules < ActiveRecord::Migration[6.1]
  def change
    create_table :test_modules do |t|
      t.string :name
      t.references :chapter, null: false, foreign_key: true
      t.float :time_taken
      t.integer :no_of_qns

      t.timestamps
    end
  end
end
