FactoryGirl.define do
  factory :trail_one, class: Trail do
    name "Trail one"
    description "Trail description"
    location

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

  factory :location, class: Location do
    geocode "34.575597, -112.427461"
  end

  factory :image, class: Image do
    url "https://dustyfeetadventures.files.wordpress.com/2015/11/img_0743.jpg?w=768&h=576"
    association :trail, factory: :trail_one
  end

end
