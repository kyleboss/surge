require 'rails_helper'

RSpec.describe "inventory_snapshot_contents/index", type: :view do
  before(:each) do
    assign(:inventory_snapshot_contents, [
      InventorySnapshotContent.create!(
        :inventory_snapshot => nil,
        :trackable => nil
      ),
      InventorySnapshotContent.create!(
        :inventory_snapshot => nil,
        :trackable => nil
      )
    ])
  end

  it "renders a list of inventory_snapshot_contents" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
