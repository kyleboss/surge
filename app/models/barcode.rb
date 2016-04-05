class Barcode < ActiveRecord::Base
  has_many :barcode_scans
  has_one :barcode_trackable_pairing
  has_one :trackable, through: :barcode_trackable_pairing
  validates_presence_of :code

  def self.new_unpaired_compatible_barcodes(rfid_reader_id)
    compatible_barcode_readers = RfidReaderBarcodeReaderPairing.where(rfid_reader_id: rfid_reader_id).uniq
                                     .pluck(:barcode_reader_id)
    unpaired_trackables = Trackable.unpaired_trackables
    unpaired_barcodes = BarcodeTrackablePairing.where(trackable_id: unpaired_trackables).uniq.pluck(:barcode_id)
    barcode_scan = BarcodeScan.where(created_at: 5.seconds.ago..Time.now).where(barcode_id: unpaired_barcodes)
        .where(barcode_reader_id: compatible_barcode_readers).order(:created_at)
    return if barcode_scan.empty?
    barcode_scan.first.barcode_id
  end

  def self.trackable(barcode_id)
    pairing = BarcodeTrackablePairing.where(barcode_id: barcode_id)
    return if pairing.empty?
    puts "pairing.first.trackable_id #{pairing.first.trackable_id}"
    pairing.first.trackable_id
  end
end
