class ChangeHospitalIdToNotNullableInRfidReaders < ActiveRecord::Migration
  def change
    change_column_null :rfid_readers, :hospital_id, false
    change_column_null :barcode_readers, :hospital_id, false
  end
end
