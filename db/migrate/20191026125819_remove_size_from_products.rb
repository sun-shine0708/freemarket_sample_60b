class RemoveSizeFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :size, :string
    add_reference :products, :size, index: true, foreign_key: true, null: true
    add_reference :products, :brand, index: true, foreign_key: true, null: true
  end
end
