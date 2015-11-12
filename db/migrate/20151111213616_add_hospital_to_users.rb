class AddHospitalToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :hospital, index: true, foreign_key: true
  end
end
