class DropAdministratorsTable < ActiveRecord::Migration
  def change
    drop_table :administrators
  end
end
