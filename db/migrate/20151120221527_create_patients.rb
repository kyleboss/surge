class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :mrn
      t.string :name
      t.references :hospital, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
