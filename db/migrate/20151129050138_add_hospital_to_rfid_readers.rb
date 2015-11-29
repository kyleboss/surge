class AddHospitalToRfidReaders < ActiveRecord::Migration
  def change
    add_reference :rfid_readers, :hospital, index: true, foreign_key: true
  end
end
