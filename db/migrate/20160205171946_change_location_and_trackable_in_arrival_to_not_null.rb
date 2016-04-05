class ChangeLocationAndTrackableInArrivalToNotNull < ActiveRecord::Migration
  def change
    change_column_null :arrivals, :location_id, false
    change_column_null :arrivals, :trackable_id, false
  end
end
