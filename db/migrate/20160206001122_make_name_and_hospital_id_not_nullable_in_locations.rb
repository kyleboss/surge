class MakeNameAndHospitalIdNotNullableInLocations < ActiveRecord::Migration
  def change
    change_column_null :locations, :name, false
    change_column_null :locations, :hospital_id, false

  end
end
