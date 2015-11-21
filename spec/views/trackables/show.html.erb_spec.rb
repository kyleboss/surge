require 'rails_helper'

RSpec.describe "trackables/show", type: :view do
  before(:each) do
    @trackable = assign(:trackable, Trackable.create!(
      :mrn => nil,
      :admin_dose => "Admin Dose",
      :drug_name => "Drug Name",
      :brand_name => "Brand Name",
      :order_id => "Order",
      :med_id => "Med"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Admin Dose/)
    expect(rendered).to match(/Drug Name/)
    expect(rendered).to match(/Brand Name/)
    expect(rendered).to match(/Order/)
    expect(rendered).to match(/Med/)
  end
end
