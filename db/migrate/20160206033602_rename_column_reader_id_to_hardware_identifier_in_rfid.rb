class RenameColumnReaderIdToHardwareIdentifierInRfid < ActiveRecord::Migration
  def change
    rename_column :rfids, :hardware_id, :hardware_identifier
    change_column_null :rfids, :hardware_identifier, false

  end
end
