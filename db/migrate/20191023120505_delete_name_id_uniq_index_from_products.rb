class DeleteNameIdUniqIndexFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_index :products, :name
  end
end
