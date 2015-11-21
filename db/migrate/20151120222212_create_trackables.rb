class CreateTrackables < ActiveRecord::Migration
  def change
    create_table :trackables do |t|
      t.references :patient, index: true, foreign_key: true
      t.string :admin_dose
      t.string :drug_name
      t.string :brand_name
      t.string :order_id
      t.string :med_id

      t.timestamps null: false
    end
  end
end
