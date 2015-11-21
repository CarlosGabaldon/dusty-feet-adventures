FactoryGirl.define do
  factory :trail_one, class: Trail do
    name "Trail one"
    description "Trail description"
    location
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
end
