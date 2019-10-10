class CreateCreditcards < ActiveRecord::Migration[5.0]
  def change
    create_table :creditcards do |t|
      t.integer :card_number, null:false
      t.integer :expiration_month, null:false
      t.integer :expiration_year, null:false
      t.integer :security_code, null:false
      t.references :user, null: false, foreign_key:true
      t.timestamps
    end
  end
end
