class CreateTestQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :test_questions do |t|
      t.references :test_module, null: false, foreign_key: true
      t.string :question
      t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
      t.string :answer

      t.timestamps
    end
  end
end
