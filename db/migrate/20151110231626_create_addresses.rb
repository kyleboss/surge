class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country

      t.timestamps null: false
    end
  end
end
