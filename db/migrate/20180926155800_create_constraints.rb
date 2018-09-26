class CreateConstraints < ActiveRecord::Migration[5.1]
  def change
    create_table :constraints do |t|
      t.string :title, limit: 40
      t.text :description
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
