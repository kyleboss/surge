require 'rails_helper'

RSpec.describe "hospitals/show", type: :view do
  before(:each) do
    @hospital = assign(:hospital, Hospital.create!(
      :name => "Name",
      :address => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
