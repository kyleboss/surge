require 'rails_helper'

RSpec.describe "barcode_scans/edit", type: :view do
  before(:each) do
    @barcode_scan = assign(:barcode_scan, BarcodeScan.create!(
      :barcode_reader => nil,
      :trackable => nil
    ))
  end

  it "renders the edit barcode_scan form" do
    render

    assert_select "form[action=?][method=?]", barcode_scan_path(@barcode_scan), "post" do

      assert_select "input#barcode_scan_barcode_reader_hardware_id[name=?]", "barcode_scan[barcode_reader_hardware_id]"

      assert_select "input#barcode_scan_trackable_id[name=?]", "barcode_scan[trackable_id]"
    end
  end
end
