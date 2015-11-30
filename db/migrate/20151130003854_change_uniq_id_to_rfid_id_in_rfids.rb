class ChangeUniqIdToRfidIdInRfids < ActiveRecord::Migration
  def change
    rename_column :rfids, :uniq_id, :rfid_id
  end
end