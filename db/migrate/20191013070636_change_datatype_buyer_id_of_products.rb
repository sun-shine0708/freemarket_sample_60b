class ChangeDatatypeBuyerIdOfProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :buyer_id, :integer, null: true
  end
end
