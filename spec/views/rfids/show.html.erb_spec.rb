require 'rails_helper'

RSpec.describe "rfids/show", type: :view do
  before(:each) do
    @rfid = assign(:rfid, Rfid.create!(
      :uniq_id => "Uniq"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uniq/)
  end
end
