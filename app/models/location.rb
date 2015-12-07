class Location < ActiveRecord::Base
  has_many :trails
  validates :lat_long_coords, presence: true
end
