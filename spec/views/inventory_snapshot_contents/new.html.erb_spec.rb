require 'rails_helper'

RSpec.describe "inventory_snapshot_contents/new", type: :view do
  before(:each) do
    assign(:inventory_snapshot_content, InventorySnapshotContent.new(
      :inventory_snapshot => nil,
      :trackable => nil
    ))
  end

  it "renders new inventory_snapshot_content form" do
    render

    assert_select "form[action=?][method=?]", inventory_snapshot_contents_path, "post" do

      assert_select "input#inventory_snapshot_content_inventory_snapshot_id[name=?]", "inventory_snapshot_content[inventory_snapshot_id]"

      assert_select "input#inventory_snapshot_content_trackable_id[name=?]", "inventory_snapshot_content[trackable_id]"
    end
  end
end
