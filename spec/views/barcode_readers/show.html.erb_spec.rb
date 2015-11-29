require 'rails_helper'

RSpec.describe "barcode_readers/show", type: :view do
  before(:each) do
    @barcode_reader = assign(:barcode_reader, BarcodeReader.create!(
      :reader_id => "Reader"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Reader/)
  end
end
