require 'rails_helper'

RSpec.describe "barcode_trackable_pairings/edit", type: :view do
  before(:each) do
    @barcode_trackable_pairing = assign(:barcode_trackable_pairing, BarcodeTrackablePairing.create!(
      :barcode => nil,
      :trackable => nil
    ))
  end

  it "renders the edit barcode_trackable_pairing form" do
    render

    assert_select "form[action=?][method=?]", barcode_trackable_pairing_path(@barcode_trackable_pairing), "post" do

      assert_select "input#barcode_trackable_pairing_barcode_id[name=?]", "barcode_trackable_pairing[barcode_id]"

      assert_select "input#barcode_trackable_pairing_trackable_id[name=?]", "barcode_trackable_pairing[trackable_id]"
    end
  end
end
