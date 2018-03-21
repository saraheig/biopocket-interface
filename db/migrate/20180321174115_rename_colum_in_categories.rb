class RenameColumInCategories < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :type, :title
  end
end
