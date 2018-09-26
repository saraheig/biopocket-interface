class ModifyTables2 < ActiveRecord::Migration[5.1]
  def change
    add_column :actions, :complement_title, :string, limit: 30
    add_column :actions, :complement_description, :text
    add_column :tasks, :complement_title, :string, limit: 30
    add_column :tasks, :complement_description, :text
    
    rename_column :tasks, :constraint_time, :time
    
    remove_column :themes, :picture
    remove_column :themes, :source
    remove_column :actions, :picture
    remove_column :actions, :source
    remove_column :species, :picture
    remove_column :species, :source
    remove_column :tasks, :short_description
  end
end
