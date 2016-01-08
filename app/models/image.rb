class Image < ActiveRecord::Base #:nodoc:
  belongs_to :trail
  validates :url, presence: true
end
