class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table :costs do |t|
      t.string :title, limit: 40
      t.decimal :value_min, precision: 10, scale: 2
      t.decimal :value_max, precision: 10, scale: 2
      t.string :unit, limit: 20
      t.references :action, foreign_key: true

      t.timestamps
    end
  end
end
