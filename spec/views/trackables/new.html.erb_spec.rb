require 'rails_helper'

RSpec.describe "trackables/new", type: :view do
  before(:each) do
    assign(:trackable, Trackable.new(
      :mrn => nil,
      :admin_dose => "MyString",
      :drug_name => "MyString",
      :brand_name => "MyString",
      :order_id => "MyString",
      :med_id => "MyString"
    ))
  end

  it "renders new trackable form" do
    render

    assert_select "form[action=?][method=?]", trackables_path, "post" do

      assert_select "input#trackable_mrn_id[name=?]", "trackable[mrn_id]"

      assert_select "input#trackable_admin_dose[name=?]", "trackable[admin_dose]"

      assert_select "input#trackable_drug_name[name=?]", "trackable[drug_name]"

      assert_select "input#trackable_brand_name[name=?]", "trackable[brand_name]"

      assert_select "input#trackable_order_id[name=?]", "trackable[order_id]"

      assert_select "input#trackable_med_id[name=?]", "trackable[med_id]"
    end
  end
end
