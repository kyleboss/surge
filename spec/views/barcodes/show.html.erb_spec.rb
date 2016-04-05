require 'rails_helper'

RSpec.describe "barcodes/show", type: :view do
  before(:each) do
    @barcode = assign(:barcode, Barcode.create!(
      :hardware_identifier => "Hardware Identifier"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Hardware Identifier/)
  end
end
