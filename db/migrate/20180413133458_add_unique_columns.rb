class AddUniqueColumns < ActiveRecord::Migration[5.1]
  def change
    add_index :actions, :title, unique: true
    add_index :actions_actions, [:ref_id, :dep_id], unique: true
    add_index :species, :name, unique: true
    add_index :species_actions, [:action_id, :species_id], unique: true
    add_index :tasks, :title, unique: true
    add_index :tasks_tasks, [:ref_id, :dep_id], unique: true
    add_index :themes, :title, unique: true
    add_index :types, :title, unique: true
    add_index :users, :pseudo, unique: true
  end
end
