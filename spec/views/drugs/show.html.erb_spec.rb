require 'rails_helper'

RSpec.describe "drugs/show", type: :view do
  before(:each) do
    @drug = assign(:drug, Drug.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
