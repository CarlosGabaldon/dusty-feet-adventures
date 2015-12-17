class RenamePathInTrailsToRoute < ActiveRecord::Migration
  def change
    rename_column :trails, :path, :route
  end
end
