class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :type, limit: 20

      t.timestamps
    end
    add_index :categories, :type, unique: true
  end
end
