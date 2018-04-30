class AddColumnToTheme < ActiveRecord::Migration[5.1]
  def change
    add_column :themes, :code, :string, limit: 5
  end
end
