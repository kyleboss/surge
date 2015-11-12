class RenameUserToAdministratorInHospital < ActiveRecord::Migration
  def change
    rename_column :hospitals, :user_id, :administrator_id
  end
end
