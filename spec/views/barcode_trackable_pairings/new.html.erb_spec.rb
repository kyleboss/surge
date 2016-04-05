require 'rails_helper'

RSpec.describe "barcode_trackable_pairings/new", type: :view do
  before(:each) do
    assign(:barcode_trackable_pairing, BarcodeTrackablePairing.new(
      :barcode => nil,
      :trackable => nil
    ))
  end

  it "renders new barcode_trackable_pairing form" do
    render

    assert_select "form[action=?][method=?]", barcode_trackable_pairings_path, "post" do

      assert_select "input#barcode_trackable_pairing_barcode_id[name=?]", "barcode_trackable_pairing[barcode_id]"

      assert_select "input#barcode_trackable_pairing_trackable_id[name=?]", "barcode_trackable_pairing[trackable_id]"
    end
  end
end
