require 'rails_helper'

RSpec.describe "hospitals/index", type: :view do
  before(:each) do
    assign(:hospitals, [
      Hospital.create!(
        :name => "Name",
        :address => nil,
        :user => nil
      ),
      Hospital.create!(
        :name => "Name",
        :address => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of hospitals" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
