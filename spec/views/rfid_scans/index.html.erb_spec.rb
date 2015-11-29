require 'rails_helper'

RSpec.describe "rfid_scans/index", type: :view do
  before(:each) do
    assign(:rfid_scans, [
      RfidScan.create!(
        :rfid_reader => nil,
        :rfid => nil
      ),
      RfidScan.create!(
        :rfid_reader => nil,
        :rfid => nil
      )
    ])
  end

  it "renders a list of rfid_scans" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
