class RemoveCardNumberFromCreditcards < ActiveRecord::Migration[5.0]
  def change
    remove_column :creditcards, :card_number, :integer
    remove_column :creditcards, :expiration_month, :integer
    remove_column :creditcards, :expiration_year, :integer
    remove_column :creditcards, :security_code, :integer
  end
end
