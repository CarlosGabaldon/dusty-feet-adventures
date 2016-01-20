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

  # Adding scope for now and only support searching by tag
  # In future add more extensive searching support
  scope :search, lambda { |tag|
    joins(:tags).where('tags.name = ?', tag)
  }

  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      tag = Tag.find_or_initialize_by(name: name)
      tags << tag unless tags.include?(tag)
    end
  end

  def tag_names
    @tag_names = ''
    tags.each do |tag|
      @tag_names << "#{tag.name} "
    end
    @tag_names
  end
end
