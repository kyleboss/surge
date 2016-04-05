class MakeMrnAndHospitalIdNotNullableInPatients < ActiveRecord::Migration
  def change
    change_column_null :patients, :name, false
    change_column_null :patients, :mrn, false
  end
end
