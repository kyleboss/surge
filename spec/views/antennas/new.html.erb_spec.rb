require 'rails_helper'

RSpec.describe "antennas/new", type: :view do
  before(:each) do
    assign(:antenna, Antenna.new(
      :hardware_id => "MyString",
      :location => nil
    ))
  end

  it "renders new antenna form" do
    render

    assert_select "form[action=?][method=?]", antennas_path, "post" do

      assert_select "input#antenna_hardware_id[name=?]", "antenna[hardware_id]"

      assert_select "input#antenna_location_id[name=?]", "antenna[location_id]"
    end
  end
end
