class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.integer :cvv
      t.references :address, index: true, foreign_key: true
      t.date :expiration_date

      t.timestamps null: false
    end
  end
end
