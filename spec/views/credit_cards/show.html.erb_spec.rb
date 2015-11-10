require 'rails_helper'

RSpec.describe "credit_cards/show", type: :view do
  before(:each) do
    @credit_card = assign(:credit_card, CreditCard.create!(
      :number => "Number",
      :cvv => 1,
      :address => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
