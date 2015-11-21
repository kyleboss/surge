require 'rails_helper'

RSpec.describe "trackables/index", type: :view do
  before(:each) do
    assign(:trackables, [
      Trackable.create!(
        :mrn => nil,
        :admin_dose => "Admin Dose",
        :drug_name => "Drug Name",
        :brand_name => "Brand Name",
        :order_id => "Order",
        :med_id => "Med"
      ),
      Trackable.create!(
        :mrn => nil,
        :admin_dose => "Admin Dose",
        :drug_name => "Drug Name",
        :brand_name => "Brand Name",
        :order_id => "Order",
        :med_id => "Med"
      )
    ])
  end

  it "renders a list of trackables" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Admin Dose".to_s, :count => 2
    assert_select "tr>td", :text => "Drug Name".to_s, :count => 2
    assert_select "tr>td", :text => "Brand Name".to_s, :count => 2
    assert_select "tr>td", :text => "Order".to_s, :count => 2
    assert_select "tr>td", :text => "Med".to_s, :count => 2
  end
end
