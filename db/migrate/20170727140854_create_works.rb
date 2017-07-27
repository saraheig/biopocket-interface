class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.references :topic, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.text :description
      t.text :impact
      t.boolean :house
      t.decimal :cost
      t.string :time
      t.integer :difficulty

      t.timestamps
    end
  end
end
