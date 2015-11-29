class AddHospitalToBarcodeReaders < ActiveRecord::Migration
  def change
    add_reference :barcode_readers, :hospital, index: true, foreign_key: true
  end
end
