class ChangeDataStatusToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :costcharge, :integer
    change_column :products, :status, :integer
  end
end
