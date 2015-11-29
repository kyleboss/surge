require 'rails_helper'

RSpec.describe "rfid_readers/new", type: :view do
  before(:each) do
    assign(:rfid_reader, RfidReader.new(
      :reader_id => "MyString"
    ))
  end

  it "renders new rfid_reader form" do
    render

    assert_select "form[action=?][method=?]", rfid_readers_path, "post" do

      assert_select "input#rfid_reader_reader_id[name=?]", "rfid_reader[reader_id]"
    end
  end
end
