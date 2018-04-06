class AddColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :themes, :source, :text
    add_column :actions, :source, :text
    add_column :species, :source, :text
    add_column :pictures, :source, :text
  end
end
