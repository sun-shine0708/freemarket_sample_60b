class AddLastNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name, :string, null:false
    add_column :users, :last_name_kana, :string, null:false
    add_column :users, :birth_month, :integer, null:false
    add_column :users, :birth_day, :integer, null:false
  end
end
