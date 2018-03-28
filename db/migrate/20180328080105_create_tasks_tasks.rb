class CreateTasksTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks_tasks do |t|
      t.references :ref
      t.references :dep

      t.timestamps
    end
    
    add_foreign_key :tasks_tasks, :tasks, column: :ref_id, primary_key: :id
    add_foreign_key :tasks_tasks, :tasks, column: :dep_id, primary_key: :id
  end
end
