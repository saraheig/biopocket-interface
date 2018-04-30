class AddForeignKeyOnUnit < ActiveRecord::Migration[5.1]
  def change
    remove_column :actions, :time_unit
    add_reference :actions, :unit
  end
end
