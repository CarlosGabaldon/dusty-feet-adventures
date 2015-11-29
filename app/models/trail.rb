class Trail < ActiveRecord::Base
  belongs_to :location
  has_many :images
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :images, reject_if: :all_blank
  validates :name, :description, presence: true
end
