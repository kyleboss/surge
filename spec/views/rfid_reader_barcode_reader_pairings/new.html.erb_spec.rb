require 'rails_helper'

RSpec.describe "rfid_reader_barcode_reader_pairings/new", type: :view do
  before(:each) do
    assign(:rfid_reader_barcode_reader_pairing, RfidReaderBarcodeReaderPairing.new(
      :barcode_reader => nil,
      :rfid_reader => nil
    ))
  end

  it "renders new rfid_reader_barcode_reader_pairing form" do
    render

    assert_select "form[action=?][method=?]", rfid_reader_barcode_reader_pairings_path, "post" do

      assert_select "input#rfid_reader_barcode_reader_pairing_barcode_reader_id[name=?]", "rfid_reader_barcode_reader_pairing[barcode_reader_id]"

      assert_select "input#rfid_reader_barcode_reader_pairing_rfid_reader_id[name=?]", "rfid_reader_barcode_reader_pairing[rfid_reader_id]"
    end
  end
end
