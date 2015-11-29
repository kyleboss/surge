require 'rails_helper'

RSpec.describe "inventory_snapshot_contents/edit", type: :view do
  before(:each) do
    @inventory_snapshot_content = assign(:inventory_snapshot_content, InventorySnapshotContent.create!(
      :inventory_snapshot => nil,
      :trackable => nil
    ))
  end

  it "renders the edit inventory_snapshot_content form" do
    render

    assert_select "form[action=?][method=?]", inventory_snapshot_content_path(@inventory_snapshot_content), "post" do

      assert_select "input#inventory_snapshot_content_inventory_snapshot_id[name=?]", "inventory_snapshot_content[inventory_snapshot_id]"

      assert_select "input#inventory_snapshot_content_trackable_id[name=?]", "inventory_snapshot_content[trackable_id]"
    end
  end
end
