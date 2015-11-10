require 'rails_helper'

RSpec.describe "drugs/edit", type: :view do
  before(:each) do
    @drug = assign(:drug, Drug.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit drug form" do
    render

    assert_select "form[action=?][method=?]", drug_path(@drug), "post" do

      assert_select "input#drug_name[name=?]", "drug[name]"
    end
  end
end
