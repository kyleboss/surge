require 'rails_helper'

RSpec.describe "rfids/index", type: :view do
  before(:each) do
    assign(:rfids, [
      Rfid.create!(
        :hardware_id => "Uniq"
      ),
      Rfid.create!(
        :hardware_id => "Uniq"
      )
    ])
  end

  it "renders a list of rfids" do
    render
    assert_select "tr>td", :text => "Uniq".to_s, :count => 2
  end
end
