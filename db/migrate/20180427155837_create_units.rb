class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :name, limit: 40
      t.string :abbreviation, limit: 40

      t.timestamps
    end

    add_index :units, :abbreviation, unique: true
  end
end
