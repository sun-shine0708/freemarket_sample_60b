class AddPhoneNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :integer, null: false, unique: true
  end
end
