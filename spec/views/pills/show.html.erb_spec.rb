require 'rails_helper'

RSpec.describe "pills/show", type: :view do
  before(:each) do
    @pill = assign(:pill, Pill.create!(
      :drug => nil,
      :brand => nil,
      :location => nil,
      :hospital => nil,
      :qty => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
