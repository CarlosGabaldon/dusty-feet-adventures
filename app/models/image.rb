class Image < ActiveRecord::Base
  belongs_to :trail
  validates :url, presence: true
end
