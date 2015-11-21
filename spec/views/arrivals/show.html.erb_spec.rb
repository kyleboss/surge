require 'rails_helper'

RSpec.describe "arrivals/show", type: :view do
  before(:each) do
    @arrival = assign(:arrival, Arrival.create!(
      :location => nil,
      :trackable => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
