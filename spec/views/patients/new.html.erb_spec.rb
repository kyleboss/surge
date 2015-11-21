require 'rails_helper'

RSpec.describe "patients/new", type: :view do
  before(:each) do
    assign(:patient, Patient.new(
      :mrn => 1,
      :name => "MyString"
    ))
  end

  it "renders new patient form" do
    render

    assert_select "form[action=?][method=?]", patients_path, "post" do

      assert_select "input#patient_mrn[name=?]", "patient[mrn]"

      assert_select "input#patient_name[name=?]", "patient[name]"
    end
  end
end
