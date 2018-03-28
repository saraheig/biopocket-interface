class CreateSpecies < ActiveRecord::Migration[5.1]
  def change
    create_table :species do |t|
      t.string :name, limit: 40
      t.text :picture
      t.text :description

      t.timestamps
    end
  end
end
