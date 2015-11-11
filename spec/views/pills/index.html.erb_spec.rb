require 'rails_helper'

RSpec.describe "pills/index", type: :view do
  before(:each) do
    assign(:pills, [
      Pill.create!(
        :drug => nil,
        :brand => nil,
        :location => nil,
        :hospital => nil,
        :qty => 1
      ),
      Pill.create!(
        :drug => nil,
        :brand => nil,
        :location => nil,
        :hospital => nil,
        :qty => 1
      )
    ])
  end

  it "renders a list of pills" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 8
    assert_select "tr>td", :text => nil.to_s, :count => 8
    assert_select "tr>td", :text => nil.to_s, :count => 8
    assert_select "tr>td", :text => nil.to_s, :count => 8
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
