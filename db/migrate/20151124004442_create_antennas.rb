class CreateAntennas < ActiveRecord::Migration
  def change
    create_table :antennas do |t|
      t.string :uniq_id
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
