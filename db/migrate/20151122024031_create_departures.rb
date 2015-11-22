class CreateDepartures < ActiveRecord::Migration
  def change
    drop_table :departures if (table_exists? :departures)
    create_table :departures do |t|
      t.references :location, index: true, foreign_key: true
      t.references :trackable, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
