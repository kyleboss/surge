class RemoveAdministratorIdFromHospitals < ActiveRecord::Migration
  def change
    remove_column :hospitals, :administrator_id
  end
end
