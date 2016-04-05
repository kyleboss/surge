require 'rails_helper'

RSpec.describe "rfids/edit", type: :view do
  before(:each) do
    @rfid = assign(:rfid, Rfid.create!(
      :hardware_id => "MyString"
    ))
  end

  it "renders the edit rfid form" do
    render

    assert_select "form[action=?][method=?]", rfid_path(@rfid), "post" do

      assert_select "input#rfid_hardware_id[name=?]", "rfid[hardware_id]"
    end
  end
end
