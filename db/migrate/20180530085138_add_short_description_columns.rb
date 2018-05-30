class AddShortDescriptionColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :themes, :short_description, :text
    add_column :actions, :short_description, :text
    add_column :tasks, :short_description, :text
  end
end
