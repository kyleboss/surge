require 'rails_helper'

RSpec.describe "credit_cards/index", type: :view do
  before(:each) do
    assign(:credit_cards, [
      CreditCard.create!(
        :number => "Number",
        :cvv => 1,
        :address => nil
      ),
      CreditCard.create!(
        :number => "Number",
        :cvv => 1,
        :address => nil
      )
    ])
  end

  it "renders a list of credit_cards" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end
