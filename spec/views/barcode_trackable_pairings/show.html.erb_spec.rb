require 'rails_helper'

RSpec.describe "barcode_trackable_pairings/show", type: :view do
  before(:each) do
    @barcode_trackable_pairing = assign(:barcode_trackable_pairing, BarcodeTrackablePairing.create!(
      :barcode => nil,
      :trackable => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
