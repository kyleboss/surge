class RenameColumnOrderIdToOrderIdentifierAndMedIdToMedIdentifierInTrackables < ActiveRecord::Migration
  def change
    rename_column :trackables, :med_id, :med_identifier
    rename_column :trackables, :order_id, :order_identifier
  end
end
