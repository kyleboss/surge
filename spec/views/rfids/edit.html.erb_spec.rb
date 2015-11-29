require 'rails_helper'

RSpec.describe "rfids/edit", type: :view do
  before(:each) do
    @rfid = assign(:rfid, Rfid.create!(
      :uniq_id => "MyString"
    ))
  end

  it "renders the edit rfid form" do
    render

    assert_select "form[action=?][method=?]", rfid_path(@rfid), "post" do

      assert_select "input#rfid_uniq_id[name=?]", "rfid[uniq_id]"
    end
  end
end
