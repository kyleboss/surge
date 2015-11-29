require 'rails_helper'

RSpec.describe "antennas/index", type: :view do
  before(:each) do
    assign(:antennas, [
      Antenna.create!(
        :uniq_id => "Uniq",
        :location => nil
      ),
      Antenna.create!(
        :uniq_id => "Uniq",
        :location => nil
      )
    ])
  end

  it "renders a list of antennas" do
    render
    assert_select "tr>td", :text => "Uniq".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
