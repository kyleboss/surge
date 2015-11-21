class AddSigAndAdminToTrackable < ActiveRecord::Migration
  def change
    add_column :trackables, :sig, :string
    add_column :trackables, :admin, :string
  end
end
