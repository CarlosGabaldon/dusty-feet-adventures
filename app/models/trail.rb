class Trail < ActiveRecord::Base
  belongs_to :location
  accepts_nested_attributes_for :location
  validates :name, :description, presence: true
end
