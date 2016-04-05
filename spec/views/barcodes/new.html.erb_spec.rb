require 'rails_helper'

RSpec.describe "barcodes/new", type: :view do
  before(:each) do
    assign(:barcode, Barcode.new(
      :hardware_identifier => "MyString"
    ))
  end

  it "renders new barcode form" do
    render

    assert_select "form[action=?][method=?]", barcodes_path, "post" do

      assert_select "input#barcode_hardware_identifier[name=?]", "barcode[hardware_identifier]"
    end
  end
end
