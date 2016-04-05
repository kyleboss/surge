class MakeHospitalIdAndHardwareIdNotNullableInBarcodeReader < ActiveRecord::Migration
  def change
    change_column_null :barcode_readers, :hardware_id, false
    change_column_null :barcode_readers, :hospital_id, false
  end
end
