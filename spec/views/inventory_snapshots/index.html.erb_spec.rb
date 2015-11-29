require 'rails_helper'

RSpec.describe "inventory_snapshots/index", type: :view do
  before(:each) do
    assign(:inventory_snapshots, [
      InventorySnapshot.create!(
        :location => nil,
        :rfid => nil
      ),
      InventorySnapshot.create!(
        :location => nil,
        :rfid => nil
      )
    ])
  end

  it "renders a list of inventory_snapshots" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
