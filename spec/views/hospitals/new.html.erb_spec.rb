require 'rails_helper'

RSpec.describe "hospitals/new", type: :view do
  before(:each) do
    assign(:hospital, Hospital.new(
      :name => "MyString",
      :address => nil,
      :user => nil
    ))
  end

  it "renders new hospital form" do
    render

    assert_select "form[action=?][method=?]", hospitals_path, "post" do

      assert_select "input#hospital_name[name=?]", "hospital[name]"

      assert_select "input#hospital_address_id[name=?]", "hospital[address_id]"

      assert_select "input#hospital_user_id[name=?]", "hospital[user_id]"
    end
  end
end
