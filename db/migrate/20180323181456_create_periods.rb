class CreatePeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :periods do |t|
      t.integer :startdate, limit: 2
      t.integer :enddate, limit: 2
      t.text :description
      t.references :task, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
