class Location < ActiveRecord::Base
  has_many :trails
  validates :state, presence: true
end
