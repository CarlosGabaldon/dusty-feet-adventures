class Trail < ActiveRecord::Base
  belongs_to :location
  accepts_nested_attributes_for :location
  has_many :images
  validates :name, :description, presence: true
end
