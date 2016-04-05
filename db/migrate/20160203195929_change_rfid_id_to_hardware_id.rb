class ChangeRfidIdToHardwareId < ActiveRecord::Migration
  def change
    rename_column :rfids, :rfid_id, :hardware_id
  end
end
