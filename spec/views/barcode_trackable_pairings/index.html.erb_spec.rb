require 'rails_helper'

RSpec.describe "barcode_trackable_pairings/index", type: :view do
  before(:each) do
    assign(:barcode_trackable_pairings, [
      BarcodeTrackablePairing.create!(
        :barcode => nil,
        :trackable => nil
      ),
      BarcodeTrackablePairing.create!(
        :barcode => nil,
        :trackable => nil
      )
    ])
  end

  it "renders a list of barcode_trackable_pairings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
