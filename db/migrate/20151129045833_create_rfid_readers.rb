class CreateRfidReaders < ActiveRecord::Migration
  def change
    create_table :rfid_readers do |t|
      t.string :reader_id

      t.timestamps null: false
    end
  end
end
