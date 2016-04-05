class MakeNameNotNullableInHospitals < ActiveRecord::Migration
  def change
    change_column_null :hospitals, :name, false
  end
end
