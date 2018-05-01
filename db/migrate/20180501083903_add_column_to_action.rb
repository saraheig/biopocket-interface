class AddColumnToAction < ActiveRecord::Migration[5.1]
  def change
    add_column :actions, :code, :string, limit: 10
  end
end
