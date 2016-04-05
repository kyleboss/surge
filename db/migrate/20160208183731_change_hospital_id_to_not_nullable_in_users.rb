class ChangeHospitalIdToNotNullableInUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :hospital_id, false
  end
end
