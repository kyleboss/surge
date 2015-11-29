require 'rails_helper'

RSpec.describe "antennas/edit", type: :view do
  before(:each) do
    @antenna = assign(:antenna, Antenna.create!(
      :uniq_id => "MyString",
      :location => nil
    ))
  end

  it "renders the edit antenna form" do
    render

    assert_select "form[action=?][method=?]", antenna_path(@antenna), "post" do

      assert_select "input#antenna_uniq_id[name=?]", "antenna[uniq_id]"

      assert_select "input#antenna_location_id[name=?]", "antenna[location_id]"
    end
  end
end
