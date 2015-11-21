class Trail < ActiveRecord::Base
  belongs_to :location
  validates :name, :description, presence: true
end
