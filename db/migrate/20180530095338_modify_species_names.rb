class ModifySpeciesNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :species, :name, :common_name
    add_column :species, :latin_name, :string, limit: 100
  end
end
