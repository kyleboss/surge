require 'rails_helper'

RSpec.describe "barcode_scans/new", type: :view do
  before(:each) do
    assign(:barcode_scan, BarcodeScan.new(
      :barcode_reader => nil,
      :trackable => nil
    ))
  end

  it "renders new barcode_scan form" do
    render

    assert_select "form[action=?][method=?]", barcode_scans_path, "post" do

      assert_select "input#barcode_scan_barcode_reader_hardware_id[name=?]", "barcode_scan[barcode_reader_hardware_id]"

      assert_select "input#barcode_scan_trackable_id[name=?]", "barcode_scan[trackable_id]"
    end
  end
end
