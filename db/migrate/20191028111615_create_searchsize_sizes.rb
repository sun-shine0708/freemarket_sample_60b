class CreateSearchsizeSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :searchsize_sizes do |t|
      t.references :size, index: true, foreign_key: true
      t.references :searchsize, index: true, foreign_key: true
      t.timestamps
    end
  end
end
