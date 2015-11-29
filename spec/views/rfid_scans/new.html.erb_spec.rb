require 'rails_helper'

RSpec.describe "rfid_scans/new", type: :view do
  before(:each) do
    assign(:rfid_scan, RfidScan.new(
      :rfid_reader => nil,
      :rfid => nil
    ))
  end

  it "renders new rfid_scan form" do
    render

    assert_select "form[action=?][method=?]", rfid_scans_path, "post" do

      assert_select "input#rfid_scan_rfid_reader_id[name=?]", "rfid_scan[rfid_reader_id]"

      assert_select "input#rfid_scan_rfid_id[name=?]", "rfid_scan[rfid_id]"
    end
  end
end
