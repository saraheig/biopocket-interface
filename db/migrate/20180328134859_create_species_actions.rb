class CreateSpeciesActions < ActiveRecord::Migration[5.1]
  def change
    create_table :species_actions do |t|
      t.references :species, foreign_key: true
      t.references :action, foreign_key: true

      t.timestamps
    end
  end
end
