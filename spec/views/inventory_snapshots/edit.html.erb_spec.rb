require 'rails_helper'

RSpec.describe "inventory_snapshots/edit", type: :view do
  before(:each) do
    @inventory_snapshot = assign(:inventory_snapshot, InventorySnapshot.create!(
      :location => nil,
      :rfid => nil
    ))
  end

  it "renders the edit inventory_snapshot form" do
    render

    assert_select "form[action=?][method=?]", inventory_snapshot_path(@inventory_snapshot), "post" do

      assert_select "input#inventory_snapshot_location_id[name=?]", "inventory_snapshot[location_id]"

      assert_select "input#inventory_snapshot_rfid_id[name=?]", "inventory_snapshot[rfid_id]"
    end
  end
end
