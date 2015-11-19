class Trail < ActiveRecord::Base
  validates :name, :description, presence: true
end
