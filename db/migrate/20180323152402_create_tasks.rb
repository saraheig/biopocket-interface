class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title, limit: 100
      t.text :description
      t.references :action, foreign_key: true

      t.timestamps
    end
  end
end
