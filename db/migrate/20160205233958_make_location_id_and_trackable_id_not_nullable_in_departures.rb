class MakeLocationIdAndTrackableIdNotNullableInDepartures < ActiveRecord::Migration
  def change
    change_column_null :departures, :trackable_id, false
    change_column_null :departures, :location_id, false
  end
end
