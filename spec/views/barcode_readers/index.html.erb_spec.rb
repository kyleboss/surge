require 'rails_helper'

RSpec.describe "barcode_readers/index", type: :view do
  before(:each) do
    assign(:barcode_readers, [
      BarcodeReader.create!(
        :reader_id => "Reader"
      ),
      BarcodeReader.create!(
        :reader_id => "Reader"
      )
    ])
  end

  it "renders a list of barcode_readers" do
    render
    assert_select "tr>td", :text => "Reader".to_s, :count => 2
  end
end
