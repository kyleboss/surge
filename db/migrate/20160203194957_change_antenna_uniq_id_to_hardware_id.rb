class ChangeAntennaUniqIdToHardwareId < ActiveRecord::Migration
  def change
    rename_column :antennas, :uniq_id, :hardware_id
  end
end
