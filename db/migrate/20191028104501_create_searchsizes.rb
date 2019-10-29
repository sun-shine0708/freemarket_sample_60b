class CreateSearchsizes < ActiveRecord::Migration[5.0]
  def change
    create_table :searchsizes do |t|
      t.string      :name
      t.timestamps
    end
  end
end
