class RemoveDepartedFromArrivals < ActiveRecord::Migration
  def change
    remove_column :arrivals, :departed_at, :datetime
  end
end
