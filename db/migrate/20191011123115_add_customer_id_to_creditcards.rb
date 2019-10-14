class AddCustomerIdToCreditcards < ActiveRecord::Migration[5.0]
  def change
    add_column :creditcards, :customer_id, :string, after: :id, null: false
    add_column :creditcards, :card_id, :string, after: :id, null: false
  end
end
