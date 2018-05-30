class ModifyDescriptionColumnsType < ActiveRecord::Migration[5.1]
  def change
    change_column :themes, :short_description, :string, limit: 255
    change_column :actions, :description, :text
    change_column :actions, :short_description, :string, limit: 255
    change_column :tasks, :short_description, :string, limit: 255
  end
end
