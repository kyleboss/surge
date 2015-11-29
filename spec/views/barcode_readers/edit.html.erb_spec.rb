require 'rails_helper'

RSpec.describe "barcode_readers/edit", type: :view do
  before(:each) do
    @barcode_reader = assign(:barcode_reader, BarcodeReader.create!(
      :reader_id => "MyString"
    ))
  end

  it "renders the edit barcode_reader form" do
    render

    assert_select "form[action=?][method=?]", barcode_reader_path(@barcode_reader), "post" do

      assert_select "input#barcode_reader_reader_id[name=?]", "barcode_reader[reader_id]"
    end
  end
end
