FactoryGirl.define do
  # Trail factories
  factory :trail, class: Trail do
    name "Trail"
    description "Trail description"
    location
  end

  factory :trail_one, parent: :trail do
    name "Trail one"
    factory :trail_with_images do
      transient do
        images_count 5
      end

      after(:create) do |trail, evaluator|
        create_list(:image, evaluator.images_count, trail: trail)
      end
    end
  end

  factory :trail_two, parent: :trail_one do
    name "Trail two"
  end

  factory :trail_missing_name, parent: :trail_one do
    name ""
  end

  factory :trail_with_route, parent: :trail do
    route  "34.549089, -112.537448|34.551259, -112.535793"
  end
 # End Trail factories

  factory :location, class: Location do
    lat_long_coords "34.575597, -112.427461"
    state "AZ"
  end

  factory :image, class: Image do
    url "https://dustyfeetadventures.files.wordpress.com/2015/11/img_0743.jpg?w=768&h=576"
    association :trail, factory: :trail_one
  end

end
