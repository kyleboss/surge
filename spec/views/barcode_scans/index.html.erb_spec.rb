require 'rails_helper'

RSpec.describe "barcode_scans/index", type: :view do
  before(:each) do
    assign(:barcode_scans, [
      BarcodeScan.create!(
        :barcode_reader => nil,
        :trackable => nil
      ),
      BarcodeScan.create!(
        :barcode_reader => nil,
        :trackable => nil
      )
    ])
  end

  it "renders a list of barcode_scans" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
