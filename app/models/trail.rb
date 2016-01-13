class Trail < ActiveRecord::Base #:nodoc:
  belongs_to :location
  has_many :images
  has_and_belongs_to_many :tags, uniq: true
  attr_accessor :tag_names
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :images, reject_if: :all_blank
  validates :name, :description, presence: true

  scope :in_state, lambda { |state|
    joins(:location).where('locations.state = ?', state)
  }

  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      tag = Tag.find_or_initialize_by(name: name)
      self.tags << tag unless self.tags.include?(tag)
    end
  end

  def tag_names
    @tag_names = ""
    self.tags.each do |tag|
      @tag_names << "#{tag.name} "
    end
    @tag_names
  end
end
