require 'rails_helper'

RSpec.describe "rfid_readers/edit", type: :view do
  before(:each) do
    @rfid_reader = assign(:rfid_reader, RfidReader.create!(
      :reader_id => "MyString"
    ))
  end

  it "renders the edit rfid_reader form" do
    render

    assert_select "form[action=?][method=?]", rfid_reader_path(@rfid_reader), "post" do

      assert_select "input#rfid_reader_reader_id[name=?]", "rfid_reader[reader_id]"
    end
  end
end
