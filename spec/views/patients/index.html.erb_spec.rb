require 'rails_helper'

RSpec.describe "patients/index", type: :view do
  before(:each) do
    assign(:patients, [
      Patient.create!(
        :mrn => 1,
        :name => "Name"
      ),
      Patient.create!(
        :mrn => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of patients" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
