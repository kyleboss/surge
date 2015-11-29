require 'rails_helper'

RSpec.describe "rfid_readers/index", type: :view do
  before(:each) do
    assign(:rfid_readers, [
      RfidReader.create!(
        :reader_id => "Reader"
      ),
      RfidReader.create!(
        :reader_id => "Reader"
      )
    ])
  end

  it "renders a list of rfid_readers" do
    render
    assert_select "tr>td", :text => "Reader".to_s, :count => 2
  end
end
