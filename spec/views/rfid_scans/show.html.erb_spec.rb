require 'rails_helper'

RSpec.describe "rfid_scans/show", type: :view do
  before(:each) do
    @rfid_scan = assign(:rfid_scan, RfidScan.create!(
      :rfid_reader => nil,
      :rfid => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
