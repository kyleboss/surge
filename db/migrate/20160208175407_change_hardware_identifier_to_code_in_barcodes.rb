class ChangeHardwareIdentifierToCodeInBarcodes < ActiveRecord::Migration
  def change
    rename_column :barcodes, :hardware_identifier, :code
  end
end
