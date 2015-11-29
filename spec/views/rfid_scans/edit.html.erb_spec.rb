require 'rails_helper'

RSpec.describe "rfid_scans/edit", type: :view do
  before(:each) do
    @rfid_scan = assign(:rfid_scan, RfidScan.create!(
      :rfid_reader => nil,
      :rfid => nil
    ))
  end

  it "renders the edit rfid_scan form" do
    render

    assert_select "form[action=?][method=?]", rfid_scan_path(@rfid_scan), "post" do

      assert_select "input#rfid_scan_rfid_reader_id[name=?]", "rfid_scan[rfid_reader_id]"

      assert_select "input#rfid_scan_rfid_id[name=?]", "rfid_scan[rfid_id]"
    end
  end
end
