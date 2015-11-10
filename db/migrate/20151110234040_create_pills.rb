class CreatePills < ActiveRecord::Migration
  def change
    create_table :pills do |t|
      t.references :drug, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.references :hospital, index: true, foreign_key: true
      t.integer :qty

      t.timestamps null: false
    end
  end
end
