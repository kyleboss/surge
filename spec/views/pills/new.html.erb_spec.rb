require 'rails_helper'

RSpec.describe "pills/new", type: :view do
  before(:each) do
    assign(:pill, Pill.new(
      :drug => nil,
      :brand => nil,
      :location => nil,
      :hospital => nil,
      :qty => 1
    ))
  end

  it "renders new pill form" do
    render

    assert_select "form[action=?][method=?]", pills_path, "post" do

      assert_select "input#pill_drug_id[name=?]", "pill[drug_id]"

      assert_select "input#pill_brand_id[name=?]", "pill[brand_id]"

      assert_select "input#pill_location_id[name=?]", "pill[location_id]"

      assert_select "input#pill_hospital_id[name=?]", "pill[hospital_id]"

      assert_select "input#pill_qty[name=?]", "pill[qty]"
    end
  end
end
