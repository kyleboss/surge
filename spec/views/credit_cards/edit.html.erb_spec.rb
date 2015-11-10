require 'rails_helper'

RSpec.describe "credit_cards/edit", type: :view do
  before(:each) do
    @credit_card = assign(:credit_card, CreditCard.create!(
      :number => "MyString",
      :cvv => 1,
      :address => nil
    ))
  end

  it "renders the edit credit_card form" do
    render

    assert_select "form[action=?][method=?]", credit_card_path(@credit_card), "post" do

      assert_select "input#credit_card_number[name=?]", "credit_card[number]"

      assert_select "input#credit_card_cvv[name=?]", "credit_card[cvv]"

      assert_select "input#credit_card_address_id[name=?]", "credit_card[address_id]"
    end
  end
end
