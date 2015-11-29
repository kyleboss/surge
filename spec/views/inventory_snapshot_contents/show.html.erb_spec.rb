require 'rails_helper'

RSpec.describe "inventory_snapshot_contents/show", type: :view do
  before(:each) do
    @inventory_snapshot_content = assign(:inventory_snapshot_content, InventorySnapshotContent.create!(
      :inventory_snapshot => nil,
      :trackable => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
