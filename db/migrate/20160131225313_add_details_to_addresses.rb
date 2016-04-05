class AddDetailsToAddresses < ActiveRecord::Migration
  def change
    change_column_null :addresses, :street_address, false
    change_column_null :addresses, :city, false
    change_column_null :addresses, :state, false
    change_column_null :addresses, :zip_code, false
    change_column_null :addresses, :country, false
  end
end
