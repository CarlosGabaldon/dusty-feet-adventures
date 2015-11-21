class Location < ActiveRecord::Base
  has_many :trails
  validates :geocode, presence: true
end
