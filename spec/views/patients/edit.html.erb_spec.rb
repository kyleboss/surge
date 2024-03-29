require 'rails_helper'

RSpec.describe "patients/edit", type: :view do
  before(:each) do
    @patient = assign(:patient, Patient.create!(
      :mrn => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit patient form" do
    render

    assert_select "form[action=?][method=?]", patient_path(@patient), "post" do

      assert_select "input#patient_mrn[name=?]", "patient[mrn]"

      assert_select "input#patient_name[name=?]", "patient[name]"
    end
  end
end
