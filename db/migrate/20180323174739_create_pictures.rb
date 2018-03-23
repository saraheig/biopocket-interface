class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :picture
      t.text :description
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
