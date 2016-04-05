require 'rails_helper'

RSpec.describe "barcodes/index", type: :view do
  before(:each) do
    assign(:barcodes, [
      Barcode.create!(
        :hardware_identifier => "Hardware Identifier"
      ),
      Barcode.create!(
        :hardware_identifier => "Hardware Identifier"
      )
    ])
  end

  it "renders a list of barcodes" do
    render
    assert_select "tr>td", :text => "Hardware Identifier".to_s, :count => 2
  end
end
