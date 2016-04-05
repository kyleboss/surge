class RenameColumnHardwareIdToHardwareIdentifierInAntennas < ActiveRecord::Migration
  def change
    rename_column :antennas, :hardware_id, :hardware_identifier
  end
end
