class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.string :stage
      t.string :budget
      t.boolean :users_required
      t.datetime :started_at
      t.json :meta
      t.text :description
      t.integer :progress
      t.references :user, null: true

      t.timestamps
    end
  end
end
