class CreateAttemptAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :attempt_answers do |t|
      t.references :attempt, null: false, foreign_key: true
      t.references :test_question, null: false, foreign_key: true
      t.string :user_answer

      t.timestamps
    end
  end
end
