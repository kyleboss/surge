require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString",
      :address => nil,
      :email => "MyString",
      :password => "MyString",
      :credit_card => nil
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_phone[name=?]", "user[phone]"

      assert_select "input#user_address_id[name=?]", "user[address_id]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_credit_card_id[name=?]", "user[credit_card_id]"
    end
  end
end
