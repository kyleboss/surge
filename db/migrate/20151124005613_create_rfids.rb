class CreateRfids < ActiveRecord::Migration
  def change
    create_table :rfids do |t|
      t.string :uniq_id

      t.timestamps null: false
    end
  end
end
