require 'rails_helper'

RSpec.describe "inventory_snapshots/new", type: :view do
  before(:each) do
    assign(:inventory_snapshot, InventorySnapshot.new(
      :location => nil,
      :rfid => nil
    ))
  end

  it "renders new inventory_snapshot form" do
    render

    assert_select "form[action=?][method=?]", inventory_snapshots_path, "post" do

      assert_select "input#inventory_snapshot_location_id[name=?]", "inventory_snapshot[location_id]"

      assert_select "input#inventory_snapshot_rfid_id[name=?]", "inventory_snapshot[rfid_id]"
    end
  end
end
