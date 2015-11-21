class AddLocationIdToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :location_id, :string
    add_index :trails, :location_id
  end
end
