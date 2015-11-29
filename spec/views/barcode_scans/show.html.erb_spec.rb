require 'rails_helper'

RSpec.describe "barcode_scans/show", type: :view do
  before(:each) do
    @barcode_scan = assign(:barcode_scan, BarcodeScan.create!(
      :barcode_reader => nil,
      :trackable => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
