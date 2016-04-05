class MakeHospitalIdNotNullableInPatients < ActiveRecord::Migration
  def change
    change_column_null :patients, :hospital_id, true
  end
end
