class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.references :user, index: true, foreign_key: true
      t.references :hospital, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
