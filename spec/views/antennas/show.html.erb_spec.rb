require 'rails_helper'

RSpec.describe "antennas/show", type: :view do
  before(:each) do
    @antenna = assign(:antenna, Antenna.create!(
      :uniq_id => "Uniq",
      :location => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uniq/)
    expect(rendered).to match(//)
  end
end
