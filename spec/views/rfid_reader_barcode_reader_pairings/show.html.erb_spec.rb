require 'rails_helper'

RSpec.describe "rfid_reader_barcode_reader_pairings/show", type: :view do
  before(:each) do
    @rfid_reader_barcode_reader_pairing = assign(:rfid_reader_barcode_reader_pairing, RfidReaderBarcodeReaderPairing.create!(
      :barcode_reader => nil,
      :rfid_reader => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
