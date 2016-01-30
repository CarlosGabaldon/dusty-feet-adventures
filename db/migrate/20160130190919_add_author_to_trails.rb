# See issue: https://github.com/rails/rails/issues/22916
require "#{Rails.root}/lib/core_extensions/active_record/connection_adapters/abstract/schema_statements"

class AddAuthorToTrails < ActiveRecord::Migration[5.0]
  def change
    add_reference :trails, :author, index: true
    add_foreign_key :trails, :users, column: :author_id
  end
end
