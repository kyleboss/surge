class AddFirstNameAndMiddleInitialAndLastNameToCreditCards < ActiveRecord::Migration
  def change
    add_column :credit_cards, :first_name, :string
    add_column :credit_cards, :middle_initial, :string
    add_column :credit_cards, :last_name, :string
  end
end
