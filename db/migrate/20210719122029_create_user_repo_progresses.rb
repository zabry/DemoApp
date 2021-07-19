class CreateUserRepoProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_repo_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reposoitory, null: false, foreign_key: true
      t.float :progress

      t.timestamps
    end
  end
end
