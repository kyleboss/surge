require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => 1,
      :country => "MyString"
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input#address_street_address[name=?]", "address[street_address]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_state[name=?]", "address[state]"

      assert_select "input#address_zip_code[name=?]", "address[zip_code]"

      assert_select "input#address_country[name=?]", "address[country]"
    end
  end
end
