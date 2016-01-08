class Location < ActiveRecord::Base #:nodoc:
  has_many :trails
  validates :state, presence: true
end
