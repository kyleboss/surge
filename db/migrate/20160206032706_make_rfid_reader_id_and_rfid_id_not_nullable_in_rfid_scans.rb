class MakeRfidReaderIdAndRfidIdNotNullableInRfidScans < ActiveRecord::Migration
  def change
    change_column_null :rfid_scans, :rfid_id, false
    change_column_null :rfid_scans, :rfid_reader_id, false
  end
end
