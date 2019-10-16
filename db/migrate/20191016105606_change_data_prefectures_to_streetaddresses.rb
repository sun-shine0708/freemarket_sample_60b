class ChangeDataPrefecturesToStreetaddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :streetaddresses, :prefectures, :integer
    rename_column :streetaddresses, :prefectures, :prefecture
  end
end
