require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :phone => "Phone",
        :address => nil,
        :email => "Email",
        :password => "Password",
        :credit_card => nil
      ),
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :phone => "Phone",
        :address => nil,
        :email => "Email",
        :password => "Password",
        :credit_card => nil
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 4
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end
