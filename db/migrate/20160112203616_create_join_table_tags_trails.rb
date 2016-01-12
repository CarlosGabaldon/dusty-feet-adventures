class CreateJoinTableTagsTrails < ActiveRecord::Migration[5.0]
  def change
    create_join_table :tags, :trails do |t|
      t.index [:tag_id, :trail_id]
      t.index [:trail_id, :tag_id]
    end
  end
end
