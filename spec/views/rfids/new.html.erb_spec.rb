require 'rails_helper'

RSpec.describe "rfids/new", type: :view do
  before(:each) do
    assign(:rfid, Rfid.new(
      :hardware_id => "MyString"
    ))
  end

  it "renders new rfid form" do
    render

    assert_select "form[action=?][method=?]", rfids_path, "post" do

      assert_select "input#rfid_uniq_id[name=?]", "rfid[uniq_id]"
    end
  end
end
