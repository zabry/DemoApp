class CreateClassrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :classrooms do |t|
      t.references :board, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
