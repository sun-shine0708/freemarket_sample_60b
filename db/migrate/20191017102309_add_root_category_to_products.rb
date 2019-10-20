class AddRootCategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :root_category, :string
  end
end
