require 'rails_helper'

RSpec.describe "rfid_reader_barcode_reader_pairings/index", type: :view do
  before(:each) do
    assign(:rfid_reader_barcode_reader_pairings, [
      RfidReaderBarcodeReaderPairing.create!(
        :barcode_reader => nil,
        :rfid_reader => nil
      ),
      RfidReaderBarcodeReaderPairing.create!(
        :barcode_reader => nil,
        :rfid_reader => nil
      )
    ])
  end

  it "renders a list of rfid_reader_barcode_reader_pairings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
