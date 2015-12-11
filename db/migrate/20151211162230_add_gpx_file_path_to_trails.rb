class AddGpxFilePathToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :gpx_file_path, :string
  end
end
