class AddColumnsToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :code, :string, limit: 10
    add_column :tasks, :constraint_time, :string, limit: 1500
    add_column :tasks, :constraint_task, :string, limit: 1500
    add_column :tasks, :recommendation, :string, limit: 1500
  end
end
