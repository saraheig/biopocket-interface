class DropPictures < ActiveRecord::Migration[5.1]
  def up
    drop_table :pictures
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
