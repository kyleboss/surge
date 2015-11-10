require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :phone => "Phone",
      :address => nil,
      :email => "Email",
      :password => "Password",
      :credit_card => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(//)
  end
end
