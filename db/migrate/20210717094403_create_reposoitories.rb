class CreateReposoitories < ActiveRecord::Migration[6.1]
  def change
    create_table :reposoitories do |t|
      t.string :name
      t.references :chapter, null: false, foreign_key: true
      t.string :filepath

      t.timestamps
    end
  end
end
