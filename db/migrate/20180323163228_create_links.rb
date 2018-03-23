class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.text :link
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
