FactoryGirl.define do
  # Trail factories
  factory :trail, class: Trail do
    name "Trail"
    description "Trail description"
    location
  end

  factory :trail_one, parent: :trail do
    name "Trail one"
    route  "34.549089, -112.537448|34.551259, -112.535793"
  end

  factory :trail_with_images, parent: :trail_one do
    transient do
      images_count 5
    end

    after(:create) do |trail, evaluator|
      create_list(:image, evaluator.images_count, trail: trail)
    end
  end

  factory :trail_two, parent: :trail_one do
    name "Trail two"
  end

  factory :trail_with_CA_location, class: Trail do
    name "Trail"
    description "Trail description"
    association :location, factory: :location_CA
  end

  factory :trail_missing_name, parent: :trail_one do
    name ""
  end

  factory :trail_with_route, parent: :trail do
    route  "34.549089, -112.537448|34.551259, -112.535793"
  end

  factory :trail_with_tag_names, parent: :trail do
    tag_names "tag_1"
  end
 # End Trail factories

  factory :location, class: Location do
    state "AZ"
  end

  factory :location_CA, class: Location do
    state "CA"
  end

  factory :image, class: Image do
    url "https://dustyfeetadventures.files.wordpress.com/2015/11/img_0743.jpg?w=768&h=576"
    association :trail, factory: :trail_one
  end

  factory :tag, class: Tag do
    name "easy"
  end

end
