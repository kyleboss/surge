class AddDepartedColumnToArrivals < ActiveRecord::Migration
  def change
    add_column :arrivals, :departed_at, :datetime
  end
end
