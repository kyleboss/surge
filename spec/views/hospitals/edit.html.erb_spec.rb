require 'rails_helper'

RSpec.describe "hospitals/edit", type: :view do
  before(:each) do
    @hospital = assign(:hospital, Hospital.create!(
      :name => "MyString",
      :address => nil,
      :user => nil
    ))
  end

  it "renders the edit hospital form" do
    render

    assert_select "form[action=?][method=?]", hospital_path(@hospital), "post" do

      assert_select "input#hospital_name[name=?]", "hospital[name]"

      assert_select "input#hospital_address_id[name=?]", "hospital[address_id]"

      assert_select "input#hospital_user_id[name=?]", "hospital[user_id]"
    end
  end
end
