class DeleteConstrainTaskColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :constraint_task
  end
end
