class AddPathToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :path, :text
  end
end
