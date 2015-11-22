require 'rails_helper'

RSpec.describe "departures/show", type: :view do
  before(:each) do
    @departure = assign(:departure, Departure.create!(
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
