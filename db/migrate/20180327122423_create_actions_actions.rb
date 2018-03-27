class CreateActionsActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions_actions do |t|
      t.references :ref
      t.references :dep

      t.timestamps
    end
    
    add_foreign_key :actions_actions, :actions, column: :ref_id, primary_key: :id
    add_foreign_key :actions_actions, :actions, column: :dep_id, primary_key: :id
  end
end
