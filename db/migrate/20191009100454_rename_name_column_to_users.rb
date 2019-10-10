class RenameNameColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :name_kana, :first_name_kana
    rename_column :users, :birthday, :birth_year
  end
end
