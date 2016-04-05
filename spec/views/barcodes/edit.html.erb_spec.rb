require 'rails_helper'

RSpec.describe "barcodes/edit", type: :view do
  before(:each) do
    @barcode = assign(:barcode, Barcode.create!(
      :hardware_identifier => "MyString"
    ))
  end

  it "renders the edit barcode form" do
    render

    assert_select "form[action=?][method=?]", barcode_path(@barcode), "post" do

      assert_select "input#barcode_hardware_identifier[name=?]", "barcode[hardware_identifier]"
    end
  end
end
