require 'rails_helper'

RSpec.describe "barcode_readers/new", type: :view do
  before(:each) do
    assign(:barcode_reader, BarcodeReader.new(
      :reader_id => "MyString"
    ))
  end

  it "renders new barcode_reader form" do
    render

    assert_select "form[action=?][method=?]", barcode_readers_path, "post" do

      assert_select "input#barcode_reader_reader_id[name=?]", "barcode_reader[reader_id]"
    end
  end
end
