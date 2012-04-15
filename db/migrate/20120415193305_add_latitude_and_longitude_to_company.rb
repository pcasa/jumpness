class AddLatitudeAndLongitudeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :latitude, :float, :precision => 15, :scale => 11
    add_column :companies, :longitude, :float, :precision => 15, :scale => 11
    add_index :companies, [:latitude, :longitude], :name => "add_index_to_companies_for_lat_lng"
  end
end
