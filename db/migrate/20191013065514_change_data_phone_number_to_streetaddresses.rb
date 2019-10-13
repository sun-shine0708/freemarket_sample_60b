class ChangeDataPhoneNumberToStreetaddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :streetaddresses, :phone_number, :string
    change_column :streetaddresses, :post_number, :string
  end
end
