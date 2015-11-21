class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.references :location, index: true, foreign_key: true
      t.references :trackable, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
