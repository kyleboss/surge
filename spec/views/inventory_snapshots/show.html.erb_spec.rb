require 'rails_helper'

RSpec.describe "inventory_snapshots/show", type: :view do
  before(:each) do
    @inventory_snapshot = assign(:inventory_snapshot, InventorySnapshot.create!(
      :location => nil,
      :rfid => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
