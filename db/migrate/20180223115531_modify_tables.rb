class ModifyTables < ActiveRecord::Migration[5.1]
  def change
    rename_table :topics, :themes
    rename_table :categories, :types
    rename_table :works, :actions
    
    add_column :themes, :picture, :text
    add_column :types, :description, :text
    add_column :actions, :spot, :boolean
    add_column :actions, :cost_min, :integer
    add_column :actions, :time_min, :integer
    add_column :actions, :time_unit, :integer, limit: 2
    add_column :actions, :time_description, :text
    add_column :actions, :surface_min, :decimal, precision: 10, scale: 2
    add_column :actions, :picture, :text
    add_column :actions, :importance, :integer, limit: 2
    
    rename_column :actions, :difficulty, :investment
    rename_column :actions, :topic_id, :theme_id
    rename_column :actions, :category_id, :type_id
    
    change_column :themes, :title, :string, limit: 40
    change_column :types, :title, :string, limit: 20
    change_column :actions, :title, :string, limit: 40
    change_column :actions, :description, :string, limit: 255
    change_column :actions, :investment, :integer, limit: 2
    
    remove_column :actions, :house
    remove_column :actions, :cost
    remove_column :actions, :time
  end
end
