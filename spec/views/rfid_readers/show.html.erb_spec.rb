require 'rails_helper'

RSpec.describe "rfid_readers/show", type: :view do
  before(:each) do
    @rfid_reader = assign(:rfid_reader, RfidReader.create!(
      :reader_id => "Reader"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Reader/)
  end
end
