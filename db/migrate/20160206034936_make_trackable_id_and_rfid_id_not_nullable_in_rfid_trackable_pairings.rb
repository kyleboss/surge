class MakeTrackableIdAndRfidIdNotNullableInRfidTrackablePairings < ActiveRecord::Migration
  def change
    change_column_null :rfid_trackable_pairings, :rfid_id, false
    change_column_null :rfid_trackable_pairings, :trackable_id, false
  end
end
