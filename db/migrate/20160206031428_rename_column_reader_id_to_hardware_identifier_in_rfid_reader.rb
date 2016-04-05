class RenameColumnReaderIdToHardwareIdentifierInRfidReader < ActiveRecord::Migration
  def change
    rename_column :rfid_readers, :reader_id, :hardware_identifier
    change_column_null :rfid_readers, :hardware_identifier, false
  end
end
