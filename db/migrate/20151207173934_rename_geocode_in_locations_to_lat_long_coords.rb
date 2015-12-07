class RenameGeocodeInLocationsToLatLongCoords < ActiveRecord::Migration
  def change
    rename_column :locations, :geocode, :lat_long_coords
  end
end
